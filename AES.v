module AES(LEDR, HEX0, HEX1, HEX2, sel, clk);
    input [1:0] sel; // 00 -> 128-bit AES, 01 -> 192-bit AES, 10/11 -> 256-bit AES
    input clk;

    output [9:0] LEDR; // 0 -> Encryption, 1 -> Decryption, 7 -> 128-bit AES, 8 -> 192-bit AES, 9 -> 256-bit AES
    output [6:0] HEX0;
    output [6:0] HEX1;
    output [6:0] HEX2;

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
    wire aesReset128 = selReg == 0 ? 1'b0 : 1'b1;
    wire [127:0] tempEncryptedOutput128;
    wire [127:0] tempDecryptedOutput128;
    wire [1407:0] allKeys128;

    KeyExpansion #(4, 10) keysGetter128(key128, allKeys128);
    AESEncrypt #(4, 10) aese128(data, allKeys128, tempEncryptedOutput128, clk, aesReset128);
    AESDecrypt #(4, 10) aesd128(tempEncryptedOutput128, allKeys128, tempDecryptedOutput128, clk, AESDecryptEnable, aesReset128);

    // 192-bit AES
    wire aesReset192 = selReg == 1 ? 1'b0 : 1'b1;
    wire [127:0] tempEncryptedOutput192;
    wire [127:0] tempDecryptedOutput192;
    wire [1663:0] allKeys192;

    KeyExpansion #(6, 12) keysGetter192(key192, allKeys192);
    AESEncrypt #(6, 12) aese192(data, allKeys192, tempEncryptedOutput192, clk, aesReset192);
    AESDecrypt #(6, 12) aesd192(tempEncryptedOutput192, allKeys192, tempDecryptedOutput192, clk, AESDecryptEnable, aesReset192);

    // 256-bit AES
    wire aesReset256 = (selReg == 2 || selReg == 3) ? 1'b0 : 1'b1;
    wire [127:0] tempEncryptedOutput256;
    wire [127:0] tempDecryptedOutput256;
    wire [1919:0] allKeys256;

    KeyExpansion #(8, 14) keysGetter(key256, allKeys256);
    AESEncrypt #(8, 14) aese256(data, allKeys256, tempEncryptedOutput256, clk, aesReset256);
    AESDecrypt #(8, 14) aesd256(tempEncryptedOutput256, allKeys256, tempDecryptedOutput256, clk, AESDecryptEnable, aesReset256);

    // Encrypted and Decrypted Data
    wire [127:0] tempEncryptedOutput = selReg == 0 ? tempEncryptedOutput128 : selReg == 1 ? tempEncryptedOutput192 : tempEncryptedOutput256;
    wire [127:0] tempDecryptedOutput = selReg == 0 ? tempDecryptedOutput128 : selReg == 1 ? tempDecryptedOutput192 : tempDecryptedOutput256;

    // Assign bcdInput based on count
    // count = 0 -> Original Data
    // count = 1 to Nr -> Encrypted Data
    // count = Nr + 2 -> Decrypted Data
    wire [7:0] bcdInput = (count == 0) ? data[7:0] : (count <= Nr + 1) ? tempEncryptedOutput[7:0] : tempDecryptedOutput[7:0];

    // Binary to BCD Logic
    wire [11:0] bcdOutput;
	Binary2BCD b2b(bcdInput, bcdOutput);

    // 7-Segment Logic
	DisplayDecoder dd1(bcdOutput[3:0], HEX0);
    DisplayDecoder dd2(bcdOutput[7:4], HEX1);
    DisplayDecoder dd3(bcdOutput[11:8], HEX2);

    // LED = 1 if Encrypted Data has finished
    assign LEDR[0] = count == Nr + 1;

    // LED = 1 if Decrypted Data is same as original data
    assign LEDR[1] = (tempDecryptedOutput == data && count > Nr + 1);

    // Mode Selection LEDs
    assign LEDR[7] = selReg == 0; // 128-bit AES
    assign LEDR[8] = selReg == 1; // 192-bit AES
    assign LEDR[9] = selReg == 2; // 256-bit AES

    // Previous Selection
    reg [1:0] prevSel = 2'b0;

    always @(negedge clk) begin
        prevSel = selReg;
        selReg = sel;

        if (prevSel != selReg) begin
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
endmodule

module AES_DUT();
    reg [1:0] sel = 2'b00;
    reg clk = 1'b1;
    wire LED;
    wire [6:0] HEX0, HEX1, HEX2;

    AES aes(LED, HEX0, HEX1, HEX2, sel, clk);

    integer count = 0;
    initial begin
        clk = 1'b1;

        forever begin
            #10 clk = ~clk;
            if (!clk) begin
                if (count < 80)
                    count = count + 1;
                
                $display("Current Round Count: %0d, LED Status: %b, Encrypted State: %h (%0d), Decrypted State: %h (%0d)", count, LED, aes.tempEncryptedOutput, aes.tempEncryptedOutput[7:0], aes.tempDecryptedOutput, aes.tempDecryptedOutput[7:0]);

                if (count == 23) begin
                    $display("==============================================");
                    $display("Switching to 192-bit AES Encryption and Decryption");
                    $display("==============================================");
                    sel = 2'b01;
                end
                else if (count == 50) begin
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
        $display("================================");
        $display("128-bit AES Encryption and Decryption");
        $display("================================");
    end
endmodule