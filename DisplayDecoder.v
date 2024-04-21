module DisplayDecoder(in,display7);
	input [3:0]in;
  	output [6:0]display7;

	always @(in)
		case(in)
            0 : display7 = 7'b0000001;
            1 : display7 = 7'b1001111;
            2 : display7 = 7'b0010010;
            3 : display7 = 7'b0000110;
            4 : display7 = 7'b1001100;
            5 : display7 = 7'b0100100;
            6 : display7 = 7'b0100000;
            7 : display7 = 7'b0001111;
            8 : display7 = 7'b0000000;
            9 : display7 = 7'b0000100;
            default : display7 = 7'b1111111; 
        endcase
	
endmodule
