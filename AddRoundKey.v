module AddRoundKey(state, roundKey, newRoundKey);
    input [127:0] state, roundKey;
    output [127:0] newRoundKey;

    assign newRoundKey= state ^ roundKey; 
endmodule

module AddRoundKey_DUT();
    reg [127:0] state, roundKey;
    wire [127:0] newRoundKey;

    AddRoundKey ark(state, roundKey, newRoundKey);

    initial begin
        state = 128'h_046681e5_e0cb199a_48f8d37a_2806264c;
        roundKey = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;
        #10
        state = newRoundKey;
        roundKey = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;
    end

    initial begin
        $display("AddRoundKey_DUT");
        $display("==================================");
        $monitor("State = %h, Key = %h, New Key= %h", state, roundKey, newRoundKey);
    end
endmodule