module main();
    reg [127:0] data;
    reg [127:0] key;
    wire [127:0] out;
    wire [127:0] out2;
    reg clk;
    wire done;

    AESEncrypt aesenc(data,key,out,clk,done);
    AESDecrypt aesdec(out,key,out2,clk,done);

    initial begin
        key = 128'h987f9dc92a3c234532afdec92a3cfbc7;
        // key = 128'h987f9dc92a3cfbc7987f9dc92a3cfbc7;
        data = "ahmedamrnabil123";
        // data = 128'h15fedf785d935ac8e74a231368454ecb;
        clk = 0;
        forever #10 clk = ~clk;

    end
endmodule