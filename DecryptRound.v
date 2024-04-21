module EncryptRound(stateIn,key,stateOut);
	input [127:0] stateIn;
	input [127:0] key;
	output [127:0] stateOut;

	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;
	wire [127:0] mixColumnsWire;

	SubBytes sub(stateIn,subByteWire);
	ShiftRows shft(subByteWire,shiftRowsWire);	
	MixColumns mix(shiftRowsWire,mixColumnsWire);	
	AddRoundKey addkey(mixColumnsWire,key,stateOut);

endmodule 


module LastEncryptRound(stateIn,key,stateOut);
	input [127:0] stateIn;
	input [127:0] key;
	output [127:0] stateOut;

	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;

	SubBytes sub(stateIn,subByteWire);
	ShiftRows shft(subByteWire,shiftRowsWire);	
	AddRoundKey addkey(shiftRowsWire,key,stateOut);

endmodule 