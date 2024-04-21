module InvSubBytes_TB();
reg [127:0] in;
wire [127:0] out;
InvSubBytes S (in, out);
initial begin
$monitor("input= %h, output= %h", in, out);
in = 128'h63cab704_0953d051_cd60e0e7_ba70e18c;
#10
in = 128'ha761ca9b_97be8b45_d8ad1a61_1fc97369;
#10
in = 128'h3b59cb73_fcd90ee0_5774222d_c067fb68;
#10
#10
$finish;
end


endmodule