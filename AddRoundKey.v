module AddRoundKey(state, roundKey, newRoundKey);
input [127:0] state,roundKey;
output [127:0] newRoundKey;
assign newRoundKey= state^roundKey; 
endmodule