module AESDecrypt #(parameter Nk = 4,parameter Nr = 10) (data,key,out,clk,active);

	input [127:0] data;
	input active;
	input [Nk * 32 - 1:0] key;
	input clk;
	output [127:0] out;
	reg [127:0] state;
	reg [127:0] keyReg; 
	reg [3:0]   roundCount = 0;
	wire [127:0] stateAfterLastRound;
	wire [127:0] stateAfterKey;
	wire [127:0] stateAfterRound;

	wire [(11 * 128) - 1:0] allKeys;

	KeyExpansion keysGetter( key , allKeys);
	AddRoundKey a(state, keyReg , stateAfterKey);
	DecryptRound round(state , keyReg , stateAfterRound);
	LastDecryptRound lastRound (state , keyReg , stateAfterLastRound);


	assign out = state;

	always @(posedge clk) begin
		if(roundCount == 0)begin
			keyReg = allKeys [ ( (11 * 128) - 1  ) -: 128 ] ;
			state = data;
		end
		else if(roundCount == 1)
			state <= stateAfterKey;
		else if (roundCount < Nr +1)
			state <= stateAfterRound;
		else if(roundCount == Nr +1)
			state <= stateAfterLastRound;

		if(roundCount > 0 && roundCount < Nr + 1)
			keyReg <= allKeys [( (11 * 128) - roundCount * 128 - 1) -: 128 ];	

		if(roundCount < Nr + 2 && active)
			roundCount <= roundCount + 1;
	end






endmodule


module AESDecrypt_DUT();
	reg [127:0] data;
	reg [127:0] key;
	wire [127:0] out;
	reg clk;

	AESDecrypt aes(data,key,out,clk);

	initial begin
		key = 128'h000102030405060708090a0b0c0d0e0f;
		data = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
		clk = 0;
		forever #10 clk = ~clk;
	end
endmodule