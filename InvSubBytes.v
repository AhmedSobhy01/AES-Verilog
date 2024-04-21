module InvSubBytes(subBytes,oriBytes);
input [127:0] subBytes;
output [127:0] oriBytes;

genvar i;
generate 
for(i=7;i<128;i=i+8) begin :Loop 
	InvSubTable s(subBytes[i -:8],oriBytes[i -:8]);
	end
endgenerate


endmodule