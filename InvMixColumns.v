module InvMixColumns (stateIn,stateOut);
	input[127:0] stateIn;
	output[127:0] stateOut;
	
	//mul2 function that multiply x by 2^n and fixes the overflow
	function [7:0] mul2(input [7:0]in,input integer n);
		integer i;
		begin
			for(i = 0; i < n; i = i + 1)begin
				if(in[7] == 1) in = (in << 1) ^ 8'h1B;
				else in = in << 1;
			end
			mul2 = in;
		end
	endfunction

	function [7:0] mb0e; //Multiply by 0e
	input [7:0] x;
	begin
		mb0e = mul2(x,3) ^ mul2(x,2)^ mul2(x,1);
	end
	endfunction

	function [7:0] mb0d; //Multiply by 0d
	input [7:0] x;
	begin
		mb0d = mul2(x,3) ^ mul2(x,2) ^ x;
	end
	endfunction

	function [7:0] mb0b;  //Multiply by 0b
	input [7:0] x;
	begin
		mb0b = mul2(x,3) ^ mul2(x,1) ^ x;
	end
	endfunction

	function [7:0] mb09; //Multiply by 09
	input [7:0] x;
	begin
		mb09 = mul2(x,3) ^  x;
	end
	endfunction
	
	genvar i;
	generate
		for(i = 0; i < 4; i = i + 1)begin
			//state[0,c] = 0e*state[0,c] + 0b*state[1,c] + 0d*state[2,c] + 09*state[3,c]
			assign stateOut[32*i+24+:8] =  mb0e(stateIn[32*i+24+:8]) ^ mb0b(stateIn[32*i+16+:8]) ^ mb0d(stateIn[32*i+8 +:8]) ^ mb09(stateIn[32*i   +:8]);
			
			//state[1,c] = 0e*state[1,c] + 0b* state[2,c] + 0d*state[3,c] + 09*state[0,c]
			assign stateOut[32*i+16+:8] =  mb0e(stateIn[32*i+16+:8]) ^ mb0b(stateIn[32*i+8 +:8]) ^ mb0d(stateIn[32*i   +:8]) ^ mb09(stateIn[32*i+24+:8]);
			
			//state[2,c] = 0e*state[2,c] + 0b* state[3,c] + 0d*state[0,c] + 09*state[1,c]
			assign stateOut[32*i+8 +:8] =  mb0e(stateIn[32*i+8 +:8]) ^ mb0b(stateIn[32*i   +:8]) ^ mb0d(stateIn[32*i+24+:8]) ^ mb09(stateIn[32*i+16+:8]);
			
			//state[3,c] = 0e*state[3,c] + 0b* state[0,c] + 0d*state[1,c] + 09*state[2,c]
			assign stateOut[32*i   +:8] =  mb0e(stateIn[32*i   +:8]) ^ mb0b(stateIn[32*i+24+:8]) ^ mb0d(stateIn[32*i+16+:8]) ^ mb09(stateIn[32*i+8 +:8]);
		end
	endgenerate


endmodule