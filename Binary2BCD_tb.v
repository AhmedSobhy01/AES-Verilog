module Binary2BCD_tb();

    reg [7:0] in;
    wire [11:0] out;

    Binary2BCD Binary2BCD_dut(
    .in(in),
    .out(out)
);



    initial begin
    in = 1;
    # 50;
    in = 112;  
    # 50;
    in = 251;
    # 50;
    in = 0;
    # 50;
    in = 156;
    # 50;
    in = 045;
    # 50;
    in = 255;
    # 50;
    in = 100;
    # 50;
    in = 124;
    # 50;
    in = 235;
    # 50;
    in = 050;



    end

    always @ (in) begin
    $display("\nin = %d", in);

    $display("\nout = %b", out);


    end

endmodule