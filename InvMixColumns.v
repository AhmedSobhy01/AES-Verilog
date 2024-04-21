module InvMixColumns(stateIn, stateOut);
	input [127:0] stateIn;
	output [127:0] stateOut;
	
	// Function to multiply by 2 and fix the overflow
	function [7:0] mul2(input [7:0] in, input integer n);
		integer i;
		begin
			for(i = 0; i < n; i = i + 1)begin
				if(in[7] == 1) in = (in << 1) ^ 8'h1B;
				else in = in << 1;
			end
			mul2 = in;
		end
	endfunction

	function [7:0] mb0e; // Multiply by 0e
	input [7:0] x;
	begin
		mb0e = mul2(x,3) ^ mul2(x,2)^ mul2(x,1);
	end
	endfunction

	function [7:0] mb0d; // Multiply by 0d
	input [7:0] x;
	begin
		mb0d = mul2(x,3) ^ mul2(x,2) ^ x;
	end
	endfunction

	function [7:0] mb0b;  // Multiply by 0b
	input [7:0] x;
	begin
		mb0b = mul2(x,3) ^ mul2(x,1) ^ x;
	end
	endfunction

	function [7:0] mb09; // Multiply by 09
	input [7:0] x;
	begin
		mb09 = mul2(x,3) ^  x;
	end
	endfunction
	
	genvar i;
	generate
		for(i = 0; i < 4; i = i + 1) begin: InvMixColumnsLoop
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

module InvMixColumns_DUT();
	reg [127:0] stateIn;
	wire [127:0] stateOut;

	InvMixColumns imc(stateIn, stateOut);

	initial begin
		stateIn = 128'hbd6e7c3df2b5779e0b61216e8b10b689;
		#10
		stateIn = 128'hfde3bad205e5d0d73547964ef1fe37f1;
		#10
		stateIn = 128'hd1876c0f79c4300ab45594add66ff41f;
	end

	initial begin
		$display("InvMixColumns_DUT");
		$display("==================================");
		$monitor("Expected: 4773b91ff72f354361cb018ea1e6cf2c, Actual: %h\n", stateOut);
		#10
		$monitor("Expected: 2d7e86a339d9393ee6570a1101904e16, Actual: %h\n", stateOut);
		#10
		$monitor("Expected: 39daee38f4f1a82aaf432410c36d45b9, Actual: %h\n", stateOut);
	end
endmodule