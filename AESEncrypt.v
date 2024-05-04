module AESEncrypt #(parameter Nk = 4, parameter Nr = 10) (data, allKeys, state, clk, reset);
	input [127:0] data;
	input [((Nr + 1) * 128) - 1:0] allKeys;
	input clk;
	input reset;
	output reg [127:0] state = 0; // Holds the state of the AES encryption

	reg [5:0] roundCount = 1; // Holds the current round count

	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;
	wire [127:0] mixColumnsWire;
	wire [127:0] roundKeyInput;
	wire [127:0] stateOut;

	// Instantiate AES modules needed for encryption
	SubBytes sub(state, subByteWire);
	ShiftRows shft(subByteWire, shiftRowsWire);
	MixColumns mix(shiftRowsWire, mixColumnsWire);
	AddRoundKey addkey(roundKeyInput , allKeys[((Nr + 1) * 128) - (roundCount - 1) * 128 - 1 -: 128], stateOut);

	// Assign roundKeyInput based on roundCount
	// roundCount = 1 -> Data
	// roundCount = 2 to Nr -> mixColumnsWire
	// roundCount = Nr + 1 -> shiftRowsWire
	assign roundKeyInput = (roundCount == 1) ? data : (roundCount < Nr + 1) ? mixColumnsWire : shiftRowsWire;


	// Update state based on roundCount
	always @(negedge clk) begin
		if (reset)
			roundCount = 1;
		else if (roundCount <= Nr + 1) begin
			state = stateOut;
			roundCount = roundCount + 6'b000001;
		end
	end
endmodule

module AESEncrypt128_DUT();
	localparam Nk = 4;
	localparam Nr = 10;

	wire [127:0] data = 128'h00112233445566778899aabbccddeeff;
	wire [Nk * 32 - 1:0] key = 128'h000102030405060708090a0b0c0d0e0f;
	wire [((Nr + 1) * 128) - 1:0] allKeys;
	wire [127:0] out;
	reg clk;

	KeyExpansion #(Nk, Nr) ke(key, allKeys);
	AESEncrypt #(Nk, Nr) aes(data, allKeys, out, clk, 1'b0);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end
endmodule

module AESEncrypt192_DUT();
	localparam Nk = 6;
	localparam Nr = 12;

	wire [127:0] data = 128'h00112233445566778899aabbccddeeff;
	wire [Nk * 32 - 1:0] key = 192'h000102030405060708090a0b0c0d0e0f1011121314151617;
	wire [((Nr + 1) * 128) - 1:0] allKeys;
	wire [127:0] out;
	reg clk;

	KeyExpansion #(Nk, Nr) ke(key, allKeys);
	AESEncrypt #(Nk, Nr) aes(data, allKeys, out, clk, 1'b0);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end
endmodule

module AESEncrypt256_DUT();
	localparam Nk = 8;
	localparam Nr = 14;

	wire [127:0] data = 128'h00112233445566778899aabbccddeeff;
	wire [Nk * 32 - 1:0] key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
	wire [((Nr + 1) * 128) - 1:0] allKeys;
	wire [127:0] out;
	reg clk;

	KeyExpansion #(Nk, Nr) ke(key, allKeys);
	AESEncrypt #(Nk, Nr) aes(data, allKeys, out, clk, 1'b0);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end
endmodule