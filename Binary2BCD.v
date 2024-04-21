
module  CondAdd3(input[3:0]in,output[3:0]out);

    assign out = in >= 5 ? in + 3 : in;

endmodule



module Binary2BCD(in , out);
    input [7:0] in;
    output [11:0] out;
    wire [28 : 1] temp;

    CondAdd3 c1( {0,in[7:5]}, temp[4 : 1]  );
    CondAdd3 c2( {temp[3:1] , in[4]}, temp[8 : 5]  );
    CondAdd3 c3( {temp[7:5] , in[3]}, temp[12 : 9]  );
    CondAdd3 c4( {temp[11:9] , in[2]}, temp[16 : 13]  );
    CondAdd3 c5( {temp[15:13] , in[1]}, temp[20 : 17]  );
    CondAdd3 c6( {0 , temp[4] , temp[8] , temp[12] }, temp[24 : 21]  );
    CondAdd3 c7( {temp[23:21] , temp[16] }, temp[28 : 25]  );

    assign out = { 0 , 0 , temp[24] , temp[28:25] , temp[20:17] , in[0]};


endmodule