module DecryptRound(stateIn,key,stateOut);
	input [127:0] stateIn;
	input [127:0] key;
	output [127:0] stateOut;

	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;
	wire [127:0] afterRoundKey;

	InvShiftRows shft(stateIn,shiftRowsWire);	
	InvSubBytes sub(shiftRowsWire,subByteWire);
	AddRoundKey addkey(subByteWire,key,afterRoundKey);
	InvMixColumns mix(afterRoundKey,stateOut);	

endmodule 

module LastDecryptRound(stateIn,key,stateOut);
	input [127:0] stateIn;
	input [127:0] key;
	output [127:0] stateOut;

	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;

	InvShiftRows shft(stateIn,shiftRowsWire);	
	InvSubBytes sub(shiftRowsWire,subByteWire);
	AddRoundKey addkey(subByteWire,key,stateOut);

endmodule 