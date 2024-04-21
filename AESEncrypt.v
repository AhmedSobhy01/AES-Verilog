Reg

module AESEncrypt #(parameter Nk = 4;parameter Nr = 10) (data,key,clk);
	input [127:0] data;
	input [Nk * 32 - 1:0] key;
	input clk;
	reg [127:0]state;
	reg [3:0] roundCount;
	
	initial begin
		state = data;
		roundCount = 0;
	end

	reg [127:0]keyReg;
	reg [127:0]roundReg;
	reg [127:0]lastRoundReg;

	AddRoundKey a(state,key,keyWire);
	EncryptRound round(state,key,keyWire);
	LastEncryptRound lastround(state,key,keyWire);

	always @(posedge clk) begin
		if(roundCount == 0)
			state <= keyReg;
		else if (roundCount < Nr)
			state <= roundReg;
		else begin
			state <= lastRoundReg;
		end
			
	end

endmodule