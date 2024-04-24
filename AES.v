module AES #(parameter Nk = 4, parameter Nr = 10) (encryptedOutput, decryptedOutput, HEX0, HEX1, HEX2, clk);
    input clk;
    output [127:0] encryptedOutput;
    output [127:0] decryptedOutput;
    output [6:0] HEX0;
    output [6:0] HEX1;
    output [6:0] HEX2;

    reg [127:0] encryptedOutputReg = 0;
    reg [127:0] decryptedOutputReg = 0;

    assign encryptedOutput = encryptedOutputReg;
    assign decryptedOutput = decryptedOutputReg;

    // Key
    wire [127:0] key = 128'h_000102030405060708090a0b0c0d0e0f;

    // Key Expansion
    wire [(11 * 128) - 1:0] allKeys;
    KeyExpansion keysGetter(key, allKeys);

    // Data
    wire [127:0] data = 128'h_00112233445566778899aabbccddeeff;

    // AES
    wire [127:0] tempEncryptedOutput;
    wire [127:0] tempDecryptedOutput;
	
    // Binary to BCD Logic
    reg [7:0] bcdInput;
    wire [11:0] bcdOutput;
	Binary2BCD b2b(bcdInput, bcdOutput);

	// 7-Segment Logic
	DisplayDecoder dd1(bcdOutput[3:0], HEX0);
    DisplayDecoder dd2(bcdOutput[7:4], HEX1);
    DisplayDecoder dd3(bcdOutput[11:8], HEX2);

    // Encrypt
    reg AESEncryptEnable = 1;
    AESEncrypt AESE(data, allKeys, tempEncryptedOutput, clk, AESEncryptEnable);

    // Decrypt
    reg AESDecryptEnable = 0;
    AESDecrypt AESD(tempEncryptedOutput, allKeys, tempDecryptedOutput, clk, AESDecryptEnable);

    reg [5:0] count = 0;
    always @(posedge clk) begin
        if (count < Nr + 2)
            bcdInput = tempEncryptedOutput[7:0];
        else if (count == Nr + 2) begin
            encryptedOutputReg = tempEncryptedOutput;
            bcdInput = tempEncryptedOutput[7:0];
            AESEncryptEnable = 0;
            AESDecryptEnable = 1;
        end
        else if (count < ((Nr + 2) * 2) + 1)
            bcdInput = tempDecryptedOutput[7:0];
        else if (count == ((Nr + 2) * 2) + 1) begin
            decryptedOutputReg = tempDecryptedOutput;
            bcdInput = tempDecryptedOutput[7:0];
            AESDecryptEnable = 0;
        end

        if (AESEncryptEnable == 1 || AESDecryptEnable == 1)
            count <= count + 1;
    end
endmodule

module AES_DUT();
    reg clk;
    wire [127:0] encrypted;
    wire [127:0] decrypted;

    AES AES(encrypted, decrypted, clk);

    reg [5:0] count = 0;
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