module InvSubBytes(subBytes, oriBytes);
	input [127:0] subBytes;
	output [127:0] oriBytes;

	genvar i;
	generate 
		for (i = 7; i < 128; i = i + 8) begin: InvSubTableLoop
			InvSubTable s(subBytes[i -:8],oriBytes[i -:8]);
		end
	endgenerate
endmodule

module InvSubBytes_DUT();
	reg [127:0] in;
	wire [127:0] out;

	InvSubBytes isb(in, out);

	initial begin
		in = 128'h63cab704_0953d051_cd60e0e7_ba70e18c;
		#10
		in = 128'ha761ca9b_97be8b45_d8ad1a61_1fc97369;
		#10
		in = 128'h3b59cb73_fcd90ee0_5774222d_c067fb68;
	end

	initial begin
		$display("InvSubBytes_DUT");
		$display("==================================");
		$monitor("Input = %h, Output = %h", in, out);
	end
endmodule