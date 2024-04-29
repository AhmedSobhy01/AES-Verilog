module AESEncrypt #(parameter Nk = 4, parameter Nr = 10) (data, allKeys, state, clk);
	input [127:0] data;
	input [(11 * 128) - 1:0] allKeys;
	input clk;

	output reg [127:0] state = 0;
	reg [3:0] roundCount = 0;

	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;
 	wire [127:0] mixColumnsWire;
 	wire  [127:0] roundKeyInput;
	wire [127:0] stateOut;

	SubBytes sub(state, subByteWire);
	ShiftRows shft(subByteWire, shiftRowsWire);	
	MixColumns mix(shiftRowsWire, mixColumnsWire);	
	AddRoundKey addkey(roundKeyInput , allKeys[(128 * roundCount) - 1 -: 128], stateOut);
	assign roundKeyInput = (roundCount == 1) ? data : 
							(roundCount < Nr + 1) ? mixColumnsWire: shiftRowsWire;

	always @(clk,data) begin
			if (roundCount == 0) begin
				state <= data;
				roundCount <= 1;
			end
			if(clk)begin
				if (roundCount <= Nr + 1)begin
					state <= stateOut;				
					roundCount <= roundCount + 1;
				end
			end
	end
endmodule

module AESEncrypt_DUT();
	wire [127:0] data = 128'h00112233445566778899aabbccddeeff;
	wire [127:0] key = 128'h000102030405060708090a0b0c0d0e0f;
	wire [(11 * 128) - 1:0] allKeys;
	wire [127:0] out;
	reg clk;

	KeyExpansion ke(key, allKeys);
	AESEncrypt aes(data, allKeys, out, clk, 1);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end
endmodule