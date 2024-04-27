module AES (encryptedOutputReg, decryptedOutputReg, HEX0, HEX1, HEX2, clk);
    localparam Nk = 4;
    localparam Nr = 10;

    input clk;
    output [6:0] HEX0;
    output [6:0] HEX1;
    output [6:0] HEX2;

    output reg [127:0] encryptedOutputReg = 128'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
    output reg [127:0] decryptedOutputReg = 128'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;

    // Key
    wire [127:0] key = 128'h000102030405060708090a0b0c0d0e0f;
    // wire [191:0] 192key = 192'h000102030405060708090a0b0c0d0e0f1011121314151617;
    // wire [255:0] 256key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;

    // Key Expansion
    wire [((Nr + 1) * 128) - 1:0] allKeys;
    KeyExpansion #(Nk, Nr) keysGetter(key, allKeys);

    // Data
    wire [127:0] data = 128'h00_11_22_33_44_55_66_77_88_99_aa_bb_cc_dd_ee_ff;

    // AES
    wire [127:0] tempEncryptedOutput;
    wire [127:0] tempDecryptedOutput;
	
    // Binary to BCD Logic
    reg [7:0] bcdInput = 8'b00000000;
    wire [11:0] bcdOutput;
	Binary2BCD b2b(bcdInput, bcdOutput);

	// 7-Segment Logic
	DisplayDecoder dd1(bcdOutput[3:0], HEX0);
    DisplayDecoder dd2(bcdOutput[7:4], HEX1);
    DisplayDecoder dd3(bcdOutput[11:8], HEX2);

    // Encrypt
    reg AESEncryptEnable = 1'b1;
    AESEncrypt #(Nk, Nr) AESE128(data, allKeys, tempEncryptedOutput, clk, AESEncryptEnable);

    // Decrypt
    reg AESDecryptEnable = 1'b0;
    AESDecrypt #(Nk, Nr) AESD(tempEncryptedOutput, allKeys, tempDecryptedOutput, clk, AESDecryptEnable);

    reg [4:0] count = 0;
    always @(posedge clk) begin
        if (AESEncryptEnable == 1 || AESDecryptEnable == 1)
            count <= count + 1;
    end

    always @(count) begin
        if (count < Nr + 1)
            bcdInput = tempEncryptedOutput[7:0];
        else if (count == Nr + 1) begin
            encryptedOutputReg = tempEncryptedOutput;
            bcdInput = tempEncryptedOutput[7:0];
            AESEncryptEnable = 1'b0;
            AESDecryptEnable = 1'b1;
        end
        else if (count < ((Nr + 1) * 2))
            bcdInput = tempDecryptedOutput[7:0];
        else if (count == ((Nr + 1) * 2)) begin
            decryptedOutputReg = tempDecryptedOutput;
            bcdInput = tempDecryptedOutput[7:0];
            AESDecryptEnable = 1'b0;
        end
    end
endmodule

module AES_DUT();
    reg clk = 1'b0;
    wire [127:0] encrypted;
    wire [127:0] decrypted;
    wire [6:0] HEX0, HEX1, HEX2;

    AES aes(encrypted, decrypted, HEX0, HEX1, HEX2, clk);

    reg [4:0] count = 5'b00000;
    initial begin
        clk = 0;
        forever begin
            #10 clk = ~clk;
            if (clk)
                count = count + 1;
        end
    end

    initial begin
        $display("AES Encryption and Decryption");
        $display("================================");
        $monitor("Encrypted: %h, Decrypted: %h, Count: %d", encrypted, decrypted, count);
    end
endmodule
