module AESDecrypt #(parameter Nk = 4, parameter Nr = 10) (data, allKeys, state, clk, enable, reset);
	input [127:0] data;
	input [((Nr + 1) * 128) - 1:0] allKeys;
	input clk;
	input enable;
	input reset;
	output reg [127:0] state; // Holds the state of the AES decryption

	reg [5:0] roundCount = 1; // Holds the current round count

	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;
	wire [127:0] mixColumnsWire;
	wire [127:0] afterRoundKey;
	wire [127:0] keyInput;
	wire [127:0] stateOut;

	// Instantiate AES modules needed for decryption
	InvShiftRows shft(state, shiftRowsWire);
	InvSubBytes sub(shiftRowsWire, subByteWire);
	AddRoundKey addkey(keyInput, allKeys[(roundCount * 128) - 1 -: 128], afterRoundKey);
	InvMixColumns mix(afterRoundKey, mixColumnsWire);

	// Assign keyInput based on roundCount
	// roundCount = 1 -> Data
	// roundCount = 2 to Nr -> subByteWire
	assign keyInput = (roundCount == 1) ? data : subByteWire;

	// Assign stateOut based on roundCount
	// roundCount = 1 -> afterRoundKey
	// roundCount = 2 to Nr -> mixColumnsWire
	assign stateOut = (roundCount > 1 && roundCount < Nr + 1) ? mixColumnsWire : afterRoundKey;

	// Update state based on roundCount
	always @(negedge clk) begin
		if (reset)
			roundCount = 1;
		else if (enable && roundCount <= Nr + 1) begin
			state = stateOut;
			roundCount = roundCount + 6'b000001;
		end
	end
endmodule

module AESDecrypt128_DUT();
	localparam Nk = 4;
	localparam Nr = 10;

	wire [127:0] data = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
	wire [Nk * 32 - 1:0] key = 128'h000102030405060708090a0b0c0d0e0f;
	wire [((Nr + 1) * 128) - 1:0] allKeys;
	wire [127:0] out;
	reg clk;

	KeyExpansion #(Nk, Nr) ke(key, allKeys);
	AESDecrypt #(Nk, Nr) aes(data, allKeys, out, clk, 1'b1);

	initial begin
		clk = 1'b1;
		forever #10 clk = ~clk;
	end
endmodule

module AESDecrypt192_DUT();
	localparam Nk = 6;
	localparam Nr = 12;

	wire [127:0] data = 128'hdda97ca4864cdfe06eaf70a0ec0d7191;
	wire [Nk * 32 - 1:0] key = 192'h000102030405060708090a0b0c0d0e0f1011121314151617;
	wire [((Nr + 1) * 128) - 1:0] allKeys;
	wire [127:0] out;
	reg clk;

	KeyExpansion #(Nk, Nr) ke(key, allKeys);
	AESDecrypt #(Nk, Nr) aes(data, allKeys, out, clk, 1'b1);

	initial begin
		clk = 1'b1;
		forever #10 clk = ~clk;
	end
endmodule

module AESDecrypt256_DUT();
	localparam Nk = 8;
	localparam Nr = 14;

	wire [127:0] data = 128'h8ea2b7ca516745bfeafc49904b496089;
	wire [Nk * 32 - 1:0] key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
	wire [((Nr + 1) * 128) - 1:0] allKeys;
	wire [127:0] out;
	reg clk;

	KeyExpansion ke(key, allKeys);
	AESDecrypt aes(data, allKeys, out, clk, 1, 0);

	initial begin
		clk = 1'b1;
		forever #10 clk = ~clk;
	end
endmodule