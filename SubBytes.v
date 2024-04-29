module SubBytes(oriBytes, subBytes);
	input [127:0] oriBytes; // Original input bytes
	output wire [127:0] subBytes; // Corresponding sub_bytes 

	genvar i;
	generate 
		for (i=7;i<128;i=i+8) begin: SubTableLoop
			SubTable s(oriBytes[i -:8],subBytes[i -:8]);
		end
	endgenerate
endmodule

module SubBytes_DUT();
	reg [127:0] in;
	wire [127:0] out;

	SubBytes sb(in, out);

	initial begin
		in = 128'h00102030_40506070_8090a0b0_c0d0e0f0;
		#10
		in = 128'h89d810e8_855ace68_2d1843d8_cb128fe4;
		#10
		in = 128'h4915598f_55e5d7a0_daca94fa_1f0a63f7;
	end

	initial begin
		$display("SubBytes_DUT");
		$display("==================================");
		$monitor("Input = %h, Output = %h", in, out);
	end
endmodule