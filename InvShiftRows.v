module InvShiftRows(in, out);
    input [127:0] in;
    output [127:0] out;

    //--------------------
    // S(0,0) in[127:120]
    // S(0,1) in[95:88]
    // S(0,2) in[63:56]
    // S(0,3) in[31:24]
    //--------------------
    // S(1,0) in[119:112]
    // S(1,1) in[87:80]
    // S(1,2) in[55:48]
    // S(1,3) in[23:16]
    //--------------------
    // S(2,0) in[111:104]
    // S(2,1) in[79:72]
    // S(2,2) in[47:40]
    // S(2,3) in[15:8]
    //--------------------
    // S(3,0) in[103:96]
    // S(3,1) in[71:64]
    // S(3,2) in[39:32]
    // S(3,3) in[7:0]
    //--------------------

    // 1st row no shift
    assign out[127:120] = in[127:120];
    assign out[95:88] = in[95:88];
    assign out[63:56] = in[63:56];
    assign out[31:24] = in[31:24];

    // 2nd row shift 1
    assign out[119:112] = in[23:16];
    assign out[87:80] = in[119:112];
    assign out[55:48] = in[87:80];
    assign out[23:16] = in[55:48];

    // 3rd row shift 2
    assign out[111:104] = in[47:40];
    assign out[79:72] = in[15:8];
    assign out[47:40] = in[111:104];
    assign out[15:8] = in[79:72];

    // 4th row shift 3
    assign out[103:96] = in[71:64];
    assign out[71:64] = in[39:32];
    assign out[39:32] = in[7:0];
    assign out[7:0] = in[103:96];
endmodule

module InvShiftRows_DUT();
    reg [127:0] in;
    wire [127:0] out;

    InvShiftRows isr(in, out);

    initial begin
        in = 128'h_aa5ece06ee6e3c56dde68bac2621bebf;
        #10;
        in = 128'h_d1ed44fd1a0f3f2afa4ff27b7c332a69;  
    end

    initial begin
        $display("InvShiftRows_DUT");
        $display("==================================");
        $monitor("in = %h, out = %h", in, out);
    end
endmodule