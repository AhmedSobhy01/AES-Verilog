module AES #(parameter Nk = 4, parameter Nr = 10) (encryptedOutputReg, decryptedOutputReg, HEX0, HEX1, HEX2, clk);
    input clk;
    output [6:0] HEX0;
    output [6:0] HEX1;
    output [6:0] HEX2;

    output reg [127:0] encryptedOutputReg = 128'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
    output reg [127:0] decryptedOutputReg = 128'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;

    // Key
    wire [127:0] key = 128'h00_01_02_03_04_05_06_07_08_09_0a_0b_0c_0d_0e_0f;

    // Key Expansion
    wire [(11 * 128) - 1:0] allKeys;
    KeyExpansion keysGetter(key, allKeys);

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
    AESEncrypt AESE(data, allKeys, tempEncryptedOutput, clk, AESEncryptEnable);

    // Decrypt
    reg AESDecryptEnable = 1'b0;
    AESDecrypt AESD(tempEncryptedOutput, allKeys, tempDecryptedOutput, clk, AESDecryptEnable);

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

    AES AES(encrypted, decrypted, HEX0, HEX1, HEX2, clk);

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
