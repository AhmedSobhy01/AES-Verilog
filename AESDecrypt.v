module AESDecrypt #(parameter Nk = 4, parameter Nr = 10) (data, allKeys, out, clk, enable);
	input [127:0] data;
	input [(11 * 128) - 1:0] allKeys;
	input clk;
	input enable;
	output [127:0] out;
	
	reg [127:0] state;
	reg [127:0] keyReg; 
	reg [3:0] roundCount = 1;
	wire [127:0] stateAfterLastRound;
	wire [127:0] stateAfterKey;
	wire [127:0] stateAfterRound;

	AddRoundKey a(state, keyReg , stateAfterKey);
	DecryptRound round(state , keyReg , stateAfterRound);
	LastDecryptRound lastRound (state , keyReg , stateAfterLastRound);

	always@(data)begin
		state = data;
	end
	
	always@(allKeys)begin
		keyReg = allKeys[((11 * 128) - 1) -: 128] ;
	end

	assign out = state;

	always @(posedge clk) begin
		if (enable == 1) begin
			if (roundCount == 1)
				state <= stateAfterKey;
			else if (roundCount < Nr +1)
				state <= stateAfterRound;
			else if (roundCount == Nr +1)
				state <= stateAfterLastRound;

			if (roundCount > 0 && roundCount < Nr + 1)
				keyReg <= allKeys[((11 * 128) - roundCount * 128 - 1) -: 128];	

			if (roundCount < Nr + 2)
				roundCount <= roundCount + 1;
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