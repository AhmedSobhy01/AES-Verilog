module SubBytes(oriBytes,subBytes);
input [127:0] oriBytes;//original input bytes
output wire [127:0] subBytes; //corresponding sub_bytes 

genvar i;
generate 
for(i=7;i<128;i=i+8) begin : Loop
	SubTable s(oriBytes[i -:8],subBytes[i -:8]);
	end
endgenerate


endmodule
