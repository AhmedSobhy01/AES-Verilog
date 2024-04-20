
module MixColumns (stateIn,stateOut);
	input[127:0] stateIn;
	output[127:0] stateOut;



	//xtime function that multiply x by 2 and fixes the overflow
	function [7:0] xtime;
		input [7:0]in;
		if(in[7] == 1) xtime = (in << 1) ^ 8'h1B;
		else xtime = in << 1;
	endfunction
	
	genvar i;
	generate
		for(i = 0; i < 4; i = i + 1)begin
			//state[0,c] = 2*state[0,c] + (2 * state[1,c] + state[1,c]) + state[2,c] + state[3,c]
			assign stateOut[32*i+24+:8] =  xtime(stateIn[32*i+24+:8]) ^ (xtime(stateIn[32*i+16+:8]) ^ stateIn[32*i+16+:8]) ^ stateIn[32*i+8 +:8] ^ stateIn[32*i   +:8];
			
			//state[1,c] = 2*state[1,c] + (2 * state[2,c] + state[2,c]) + state[3,c] + state[0,c]
			assign stateOut[32*i+16+:8] =  xtime(stateIn[32*i+16+:8]) ^ (xtime(stateIn[32*i+8 +:8]) ^ stateIn[32*i+8 +:8]) ^ stateIn[32*i   +:8] ^ stateIn[32*i+24+:8];
			
			//state[2,c] = 2*state[2,c] + (2 * state[3,c] + state[3,c]) + state[0,c] + state[1,c]
			assign stateOut[32*i+8 +:8] =  xtime(stateIn[32*i+8 +:8]) ^ (xtime(stateIn[32*i   +:8]) ^ stateIn[32*i   +:8]) ^ stateIn[32*i+24+:8] ^ stateIn[32*i+16+:8];
			
			//state[3,c] = 2*state[3,c] + (2 * state[0,c] + state[0,c]) + state[1,c] + state[2,c]
			assign stateOut[32*i   +:8] =  xtime(stateIn[32*i   +:8]) ^ (xtime(stateIn[32*i+24+:8]) ^ stateIn[32*i+24+:8]) ^ stateIn[32*i+16+:8] ^ stateIn[32*i+8 +:8];
		end
	endgenerate


endmodule