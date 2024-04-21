module AddRoundKey_TB();
reg [127:0] state,roundKey;
wire [127:0] newRoundKey;
AddRoundKey S (state,roundKey,newRoundKey);
initial begin
    $monitor("state = %h, key = %h, new key= %h", state, roundKey, newRoundKey);
    state = 128'h_046681e5_e0cb199a_48f8d37a_2806264c;
	roundKey = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;
    #10
    state = newRoundKey;
	roundKey = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;
end
endmodule