
module AESEncrypt #(parameter Nk = 4,parameter Nr = 10) (data,key,out,clk);
	input [127:0] data;
	input [Nk * 32 - 1:0] key;
	input clk;
	output [127:0] out;
	reg [127:0]state;
	reg [127:0] keyReg;
	reg [3:0] roundCount = 0;
	wire [127:0] stateAfterLastRound;
	wire [127:0] stateAfterKey;
	wire [127:0] stateAfterRound;
	wire [127:0] keyWire;

	KeyExpansionRound keyexpround(roundCount,keyReg,keyWire);
	AddRoundKey a(state,keyReg,stateAfterKey);
	EncryptRound round(state,keyReg,stateAfterRound);
	LastEncryptRound lastRound(state,keyReg,stateAfterLastRound);


	assign out = state;

	always @(posedge clk) begin
		if(roundCount == 0)begin
			keyReg = key;
			state = data;
		end
		else if(roundCount == 1)
			state <= stateAfterKey;
		else if (roundCount < Nr +1)
			state <= stateAfterRound;
		else if(roundCount == Nr +1)
			state <= stateAfterLastRound;

		if(roundCount > 0 && roundCount < Nr + 1)
			keyReg <= keyWire;	

		if(roundCount < Nr + 2)
			roundCount <= roundCount + 1;
	end

endmodule


module AESEncrypt_DUT();
	reg [127:0] data;
	reg [127:0] key;
	wire [127:0] out;
	reg clk;

	AESEncrypt aes(data,key,out,clk);

	initial begin
		key = 128'h000102030405060708090a0b0c0d0e0f;
		data = 128'h00112233445566778899aabbccddeeff;
		clk = 0;
		forever #10 clk = ~clk;
	end
endmodule


