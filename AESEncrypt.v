module AESEncrypt #(parameter Nk = 4, parameter Nr = 10) (data, allKeys, out, clk, enable);
	input [127:0] data;
	input [((Nr + 1) * 128) - 1:0] allKeys;
	input clk;
	input enable;
	output [127:0] out;

	reg [127:0] state;
	reg [127:0] keyReg;
  reg [4:0] roundCount = 1;
	wire [127:0] stateAfterLastRound;
	wire [127:0] stateAfterKey;
	wire [127:0] stateAfterRound;

	AddRoundKey a(state, keyReg, stateAfterKey);
	EncryptRound round(state, keyReg, stateAfterRound);
	LastEncryptRound lastRound(state, keyReg, stateAfterLastRound);
  
  always@(data)begin
		state = data;
	end
	
	always@(allKeys)begin
		keyReg = allKeys[((Nr + 1) * 128) - 1 -: 128];
	end

	assign out = state;

  always @(posedge clk) begin
		if (enable) begin
				if (roundCount == 1)
					state <= stateAfterKey;
				else if (roundCount < Nr + 1)
					state <= stateAfterRound;
				else if (roundCount == Nr + 1)
					state <= stateAfterLastRound;

				if (roundCount > 0 && roundCount < Nr + 1)
					keyReg <= allKeys[((Nr + 1) * 128) - 1 - 128 * roundCount -: 128];

				if (roundCount < Nr + 2)
					roundCount <= roundCount + 1;
			end
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
	AESEncrypt #(Nk, Nr) aes(data, allKeys, out, clk, 1'b1);

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
	AESEncrypt #(Nk, Nr) aes(data, allKeys, out, clk, 1'b1);

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
	AESEncrypt #(Nk, Nr) aes(data, allKeys, out, clk, 1'b1);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end
endmodule