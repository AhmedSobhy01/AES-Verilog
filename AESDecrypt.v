module AESDecrypt #(parameter Nk = 4, parameter Nr = 10) (data, allKeys, state, clk, enable);
	input [127:0] data;
	input [(11 * 128) - 1:0] allKeys;
	input clk;
	input enable;
	output reg [127:0] state;
	reg [3:0] roundCount = 0;
	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;
	wire [127:0] mixColumnsWire;
	wire [127:0] afterRoundKey;
	wire [127:0] keyInput;
	wire [127:0] stateOut;

	InvShiftRows shft(state, shiftRowsWire);	
	InvSubBytes sub(shiftRowsWire, subByteWire);
	AddRoundKey addkey(keyInput, allKeys[((12 - roundCount) * 128 - 1) -: 128], afterRoundKey);
	InvMixColumns mix(afterRoundKey, mixColumnsWire);	
	assign keyInput = (roundCount == 1) ? data : subByteWire;
	assign stateOut = (roundCount > 1 && roundCount < Nr + 1) ? mixColumnsWire : afterRoundKey;

	always @(clk,data) begin
		if(enable)begin
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
	end
endmodule

module AESDecrypt_DUT();
	wire [127:0] data = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
	wire [127:0] key = 128'h000102030405060708090a0b0c0d0e0f;
	wire [(11 * 128) - 1:0] allKeys;
	wire [127:0] out;
	reg clk;

	KeyExpansion ke(key, allKeys);
	AESDecrypt aes(data, allKeys, out, clk, 1);

	initial begin
		clk = 0;
		forever #10 clk = ~clk;
	end
endmodule