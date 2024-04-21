
module CondAdd3(in, out);
    input [3:0] in;
    output [3:0] out;

    assign out = in >= 5 ? in + 3:in;
endmodule

module Binary2BCD(in, out);
    input [7:0] in;
    output [11:0] out;
    wire [28:1] temp;

    CondAdd3 c1({0,in[7:5]}, temp[4:1]);
    CondAdd3 c2({temp[3:1], in[4]}, temp[8:5]);
    CondAdd3 c3({temp[7:5], in[3]}, temp[12:9]);
    CondAdd3 c4({temp[11:9], in[2]}, temp[16:13]);
    CondAdd3 c5({temp[15:13], in[1]}, temp[20:17]);
    CondAdd3 c6({0, temp[4], temp[8], temp[12]}, temp[24:21]);
    CondAdd3 c7({temp[23:21], temp[16]}, temp[28:25]);

    assign out = {0, 0, temp[24], temp[28:25], temp[20:17], in[0]};
endmodule

module Binary2BCD_DUT();
    reg [7:0] in;
    wire [11:0] out;

    Binary2BCD b2b(in, out);

    initial begin
        in = 1;
        #10;
        in = 112;  
        #10;
        in = 251;
        #10;
        in = 0;
        #10;
        in = 156;
        #10;
        in = 045;
        #10;
        in = 255;
        #10;
        in = 100;
        #10;
        in = 124;
        #10;
        in = 235;
        #10;
        in = 050;
    end

    initial begin
        $display("Binary2BCD_DUT");
        $display("==================================");
        $monitor("Expected: 000000000001, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000000011100, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000010010011, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000000000000, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000000010110, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000000010101, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000000111111, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000000011001, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000000011100, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000000111011, Actual: %h\n",out);
        #10;
        $monitor("Expected: 000000010010, Actual: %h\n",out);
    end
endmodule