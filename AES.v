module AES(LED, HEX0, HEX1, HEX2, clk, reset);
	localparam Nk = 4;
	localparam Nr = 10;

    input clk;
	input reset;
    output LED;
    output [6:0] HEX0;
    output [6:0] HEX1;
    output [6:0] HEX2;
    output [6:0] HEX3;
    output [6:0] HEX4;
    output [6:0] HEX5;

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

    // Current round count for encryption and decryption
    reg [5:0] count;
	initial
		count = 0;

    // Assign bcdInput based on count
    // count = 0 -> Encrypted Data
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

    // Encrypt
    // reg AESEncryptEnable = 1'b1;
    AESEncrypt AESE(data, allKeys, tempEncryptedOutput, clk,reset);

    // Decrypt
    reg AESDecryptEnable = 1'b0;
    AESDecrypt AESD(tempEncryptedOutput, allKeys, tempDecryptedOutput, clk, AESDecryptEnable,reset);

    // LED = 1 if Decrypted Data is same as original data
    assign LED = (tempDecryptedOutput == data && count > Nr + 1);

    always @(negedge clk) begin
		if (reset) begin
			count = 0;
			AESDecryptEnable = 1'b0;
		end
		else begin
			if (count == Nr)
				AESDecryptEnable = 1'b1;
			else if (count == ((Nr + 1) * 2))
				AESDecryptEnable = 1'b0;

            if (count <= (Nr + 1) * 2)
                count <= count + 6'b000001;
		end
    end
endmodule

module AES_DUT();
    reg clk = 1'b1;
    wire LED;
    wire [6:0] HEX0, HEX1, HEX2;

    AES aes(LED, HEX0, HEX1, HEX2, clk, 1'b0);

    reg [5:0] count = 0;
    initial begin
        clk = 1'b1;
        forever begin
            #10 clk = ~clk;
            if (!clk) begin
                count = count + 1;
                $display("Current Round Count: %d, LED Status: %b, Encrypted State: %h (%0d), Decrypted State: %h (%0d)", count, LED, aes.tempEncryptedOutput, aes.tempEncryptedOutput[7:0], aes.tempDecryptedOutput, aes.tempDecryptedOutput[7:0]);
            end
        end
    end

    initial begin
        $display("AES Encryption and Decryption");
        $display("================================");
    end
endmodule