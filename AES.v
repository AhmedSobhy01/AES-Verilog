module AES(LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, sel, clk, reset, enable);
    input [1:0] sel; // 00 -> 128-bit AES, 01 -> 192-bit AES, 10/11 -> 256-bit AES
    input clk;
    input reset;
    input enable;

    output [9:0] LEDR; // 0 -> Encryption Success, 1 -> Decryption Success, 5 -> 128-bit AES, 6 -> 192-bit AES, 7 -> 256-bit AES, 9 -> Reset

    output [6:0] HEX0; // First bit of state (LSB)
    output [6:0] HEX1; // Second bit of state
    output [6:0] HEX2; // Third bit of state

    output [6:0] HEX3; // First hexadecimal digit of state (LSB)
    output [6:0] HEX4; // Second hexadecimal digit of state
    output [6:0] HEX5; // Third hexadecimal digit of state

    // Keys
    wire [127:0] key128 = 128'h000102030405060708090a0b0c0d0e0f;
    wire [191:0] key192 = 192'h000102030405060708090a0b0c0d0e0f1011121314151617;
    wire [255:0] key256 = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;

    // Nr / Nk
    wire [3:0] Nr = sel == 0 ? 4'b1010 : sel == 1 ? 4'b1100 : 4'b1110;

    // Data
    wire [127:0] data = 128'h00_11_22_33_44_55_66_77_88_99_aa_bb_cc_dd_ee_ff;

    // Current round count for encryption and decryption
    reg [5:0] count = 0;

    // AES Decrypt Enable
    reg AESDecryptEnable = 1'b0;

    // Selection Reg
    reg [1:0] selReg = 0;

    // 128-bit AES
    wire aesReset128 = (reset || selReg != 0) ? 1'b1 : 1'b0;
    wire [127:0] tempEncryptedOutput128;
    wire [127:0] tempDecryptedOutput128;
    wire [1407:0] allKeys128;

    KeyExpansion #(4, 10) keysGetter128(key128, allKeys128);
    AESEncrypt #(4, 10) aese128(data, allKeys128, tempEncryptedOutput128, clk, enable, aesReset128);
    AESDecrypt #(4, 10) aesd128(tempEncryptedOutput128, allKeys128, tempDecryptedOutput128, clk, AESDecryptEnable & enable, aesReset128);

    // 192-bit AES
    wire aesReset192 = (reset || selReg != 1) ? 1'b1 : 1'b0;
    wire [127:0] tempEncryptedOutput192;
    wire [127:0] tempDecryptedOutput192;
    wire [1663:0] allKeys192;

    KeyExpansion #(6, 12) keysGetter192(key192, allKeys192);
    AESEncrypt #(6, 12) aese192(data, allKeys192, tempEncryptedOutput192, clk, enable, aesReset192);
    AESDecrypt #(6, 12) aesd192(tempEncryptedOutput192, allKeys192, tempDecryptedOutput192, clk, AESDecryptEnable & enable, aesReset192);

    // 256-bit AES
    wire aesReset256 = (reset || selReg == 0 || selReg == 1) ? 1'b1 : 1'b0;
    wire [127:0] tempEncryptedOutput256;
    wire [127:0] tempDecryptedOutput256;
    wire [1919:0] allKeys256;

    KeyExpansion #(8, 14) keysGetter(key256, allKeys256);
    AESEncrypt #(8, 14) aese256(data, allKeys256, tempEncryptedOutput256, clk, enable, aesReset256);
    AESDecrypt #(8, 14) aesd256(tempEncryptedOutput256, allKeys256, tempDecryptedOutput256, clk, AESDecryptEnable & enable, aesReset256);

    // Encrypted and Decrypted Data
    wire [127:0] tempEncryptedOutput = selReg == 0 ? tempEncryptedOutput128 : selReg == 1 ? tempEncryptedOutput192 : tempEncryptedOutput256;
    wire [127:0] tempDecryptedOutput = selReg == 0 ? tempDecryptedOutput128 : selReg == 1 ? tempDecryptedOutput192 : tempDecryptedOutput256;

    // Assign bcdInput based on count
    // count = 0 -> Original Data
    // count = 1 to Nr -> Encrypted Data
    // count = Nr + 2 -> Decrypted Data
    wire [11:0] bcdInput = (count == 0) ? data[11:0] : (count <= Nr + 1) ? tempEncryptedOutput[11:0] : tempDecryptedOutput[11:0];

    // Binary to BCD Logic
    wire [11:0] bcdOutput;
	Binary2BCD b2b(bcdInput[7:0], bcdOutput);

    // 7-Segment Logic
    wire SevenSegEnable = ~reset;
	DisplayDecoder dd1(bcdOutput[3:0], HEX0, SevenSegEnable);
    DisplayDecoder dd2(bcdOutput[7:4], HEX1, SevenSegEnable);
    DisplayDecoder dd3(bcdOutput[11:8], HEX2, SevenSegEnable);

    DisplayDecoder dd4(bcdInput[3:0], HEX3, SevenSegEnable);
    DisplayDecoder dd5(bcdInput[7:4], HEX4, SevenSegEnable);
    DisplayDecoder dd6(bcdInput[11:8], HEX5, SevenSegEnable);

    // LED = 1 if Encrypted Data has finished
    assign LEDR[0] = count >= Nr + 1;

    // LED = 1 if Decrypted Data is same as original data
    assign LEDR[1] = (tempDecryptedOutput == data && count > Nr + 1);

    // Mode Selection LEDs
    assign LEDR[5] = (~reset && selReg == 0); // 128-bit AES
    assign LEDR[6] = (~reset && selReg == 1); // 192-bit AES
    assign LEDR[7] = (~reset && (selReg == 2 || selReg == 3)); // 256-bit AES

    // Reset LED
    assign LEDR[9] = reset;

    // Turn off remaining LEDs
    assign LEDR[4:2] = 3'b0;
    assign LEDR[8] = 1'b0;

    // Previous Selection
    reg [1:0] prevSel = 2'b0;

    always @(negedge clk or posedge reset) begin
        if (reset) begin
            prevSel = 2'b00;
            selReg = sel;
            count = 0;
            AESDecryptEnable = 1'b0;
        end
        else if (enable) begin
            prevSel = selReg;
            selReg = sel;

            if (prevSel != selReg && !(selReg == 2 && prevSel == 3 || selReg == 3 && prevSel == 2)) begin
                prevSel = selReg;
                count = 0;
                AESDecryptEnable = 1'b0;
            end
            else begin
                if (count == Nr)
                    AESDecryptEnable = 1'b1;
                else if (count == ((Nr + 1) * 2))
                    AESDecryptEnable = 1'b0;

                if (count <= (Nr + 1) * 2)
                    count = count + 6'b000001;
            end
        end
    end
endmodule

module AES_DUT();
    reg [1:0] sel = 2'b00;
    reg clk = 1'b1;
    reg reset = 1'b0;
    reg enable = 1'b1;
    wire [9:0] LEDR;
    wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

    AES aes(LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, sel, clk, reset, enable);

    integer count = 0;
    initial begin
        clk = 1'b1;

        forever begin
            #10 clk = ~clk;
            if (!clk) begin
                if (count < 80)
                    count = count + 1;
                
                $display("\n");
                $display("Current Round Count: %0d, Encrypted State: %h (%0d), Decrypted State: %h (%0d)", count, aes.tempEncryptedOutput, aes.tempEncryptedOutput[7:0], aes.tempDecryptedOutput, aes.tempDecryptedOutput[7:0]);
                $display("LEDs: Reset: %0d, 256-bit AES: %0d, 192-bit AES: %0d, 128-bit AES: %0d, Decryption: %0d, Encryption: %0d", LEDR[9], LEDR[7], LEDR[6], LEDR[5], LEDR[1], LEDR[0]);
                $display("HEX: %b (%h) %b (%h) %b (%h) %b (%0d) %b (%0d) %b (%0d)", HEX5, aes.bcdInput[11:8], HEX4, aes.bcdInput[7:4], HEX3, aes.bcdInput[3:0], HEX2, aes.bcdOutput[11:8], HEX1, aes.bcdOutput[7:4], HEX0, aes.bcdOutput[3:0]);

                if (count == 23) begin
                    $display("\n");
                    $display("==============================================");
                    $display("Switching to 192-bit AES Encryption and Decryption");
                    $display("==============================================");
                    sel = 2'b01;
                end
                else if (count == 50) begin
                    $display("\n");
                    $display("==============================================");
                    $display("Switching to 256-bit AES Encryption and Decryption");
                    $display("==============================================");
                    sel = 2'b10;
                end
            end
        end
    end

    initial begin
        $display("AES Encryption and Decryption");
        $display("\n");
        $display("================================");
        $display("128-bit AES Encryption and Decryption");
        $display("================================");
    end
endmodule