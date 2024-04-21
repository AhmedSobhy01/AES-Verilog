module SubBytes_TB();
reg [127:0] in;
wire [127:0] out;
SubBytes S(in, out);
initial begin
$monitor("input= %h, output= %h", in, out);
in = 128'h00102030_40506070_8090a0b0_c0d0e0f0;
#10
in = 128'h89d810e8_855ace68_2d1843d8_cb128fe4;
#10
in = 128'h4915598f_55e5d7a0_daca94fa_1f0a63f7;
#10
#10
$finish;
end
endmodule