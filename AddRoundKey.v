module AddRoundKey(state, roundKey, stateOut);
    input [127:0] state, roundKey;
    output [127:0] stateOut;

    assign stateOut= state ^ roundKey; 
endmodule

module AddRoundKey_DUT();
    reg [127:0] state, roundKey;
    wire [127:0] stateOut;

    AddRoundKey ark(state, roundKey, stateOut);

    initial begin
        state = 128'h_046681e5_e0cb199a_48f8d37a_2806264c;
        roundKey = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;
        #10
        state = stateOut;
        roundKey = 128'h_a0fafe17_88542cb1_23a33939_2a6c7605;
    end

    initial begin
        $display("AddRoundKey_DUT");
        $display("==================================");
        $monitor("State = %h, Key = %h, New Key= %h", state, roundKey, stateOut);
    end
endmodule