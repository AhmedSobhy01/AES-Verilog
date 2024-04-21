
module MixColumns(stateIn, stateOut);
	input [127:0] stateIn;
	output [127:0] stateOut;

	// Function to multiply by 2 and fix the overflow
	function [7:0] xtime;
		input [7:0] in;
		if(in[7] == 1) xtime = (in << 1) ^ 8'h1B;
		else xtime = in << 1;
	endfunction

	genvar i;
	generate
		for(i = 0; i < 4; i = i + 1)begin: mixColumnsLoop
			// state[0,c] = 2*state[0,c] + (2 * state[1,c] + state[1,c]) + state[2,c] + state[3,c]
			assign stateOut[32*i+24+:8] =  xtime(stateIn[32*i+24+:8]) ^ (xtime(stateIn[32*i+16+:8]) ^ stateIn[32*i+16+:8]) ^ stateIn[32*i+8 +:8] ^ stateIn[32*i   +:8];
			
			// state[1,c] = 2*state[1,c] + (2 * state[2,c] + state[2,c]) + state[3,c] + state[0,c]
			assign stateOut[32*i+16+:8] =  xtime(stateIn[32*i+16+:8]) ^ (xtime(stateIn[32*i+8 +:8]) ^ stateIn[32*i+8 +:8]) ^ stateIn[32*i   +:8] ^ stateIn[32*i+24+:8];
			
			// state[2,c] = 2*state[2,c] + (2 * state[3,c] + state[3,c]) + state[0,c] + state[1,c]
			assign stateOut[32*i+8 +:8] =  xtime(stateIn[32*i+8 +:8]) ^ (xtime(stateIn[32*i   +:8]) ^ stateIn[32*i   +:8]) ^ stateIn[32*i+24+:8] ^ stateIn[32*i+16+:8];
			
			// state[3,c] = 2*state[3,c] + (2 * state[0,c] + state[0,c]) + state[1,c] + state[2,c]
			assign stateOut[32*i   +:8] =  xtime(stateIn[32*i   +:8]) ^ (xtime(stateIn[32*i+24+:8]) ^ stateIn[32*i+24+:8]) ^ stateIn[32*i+16+:8] ^ stateIn[32*i+8 +:8];
		end
	endgenerate
endmodule

module MixColumns_DUT();
	reg [127:0] stateIn;
	wire [127:0] stateOut;

	MixColumns mc(stateIn, stateOut);

	initial begin
		stateIn = 128'h6353e08c0960e104cd70b751bacad0e7;
		#10
		stateIn = 128'h84e1dd691a41d76f792d389783fbac70;
		#10
		stateIn = 128'h1fb5430ef0accf64aa370cde3d77792c;
	end

	initial begin
		$display("MixColumns_DUT");
        $display("==================================");
		$monitor("Expected: 5f72641557f5bc92f7be3b291db9f91a, Actual: %h\n",stateOut);
		#10
		$monitor("Expected: 9f487f794f955f662afc86abd7f1ab29, Actual: %h\n",stateOut);
		#10
		$monitor("Expected: b7a53ecbbf9d75a0c40efc79b674cc11, Actual: %h\n",stateOut);
	end
endmodule