module SubTable(oriByte, subByte);
	input [7:0] oriByte; // Original byte
	output reg [7:0] subByte; // Corresponding sub_byte
    
	always @(oriByte) begin
		case (oriByte)
			8'h00: subByte=8'h63;
			8'h01: subByte=8'h7c;
			8'h02: subByte=8'h77;
			8'h03: subByte=8'h7b;
			8'h04: subByte=8'hf2;
			8'h05: subByte=8'h6b;
			8'h06: subByte=8'h6f;
			8'h07: subByte=8'hc5;
			8'h08: subByte=8'h30;
			8'h09: subByte=8'h01;
			8'h0a: subByte=8'h67;
			8'h0b: subByte=8'h2b;
			8'h0c: subByte=8'hfe;
			8'h0d: subByte=8'hd7;
			8'h0e: subByte=8'hab;
			8'h0f: subByte=8'h76;
			8'h10: subByte=8'hca;
			8'h11: subByte=8'h82;
			8'h12: subByte=8'hc9;
			8'h13: subByte=8'h7d;
			8'h14: subByte=8'hfa;
			8'h15: subByte=8'h59;
			8'h16: subByte=8'h47;
			8'h17: subByte=8'hf0;
			8'h18: subByte=8'had;
			8'h19: subByte=8'hd4;
			8'h1a: subByte=8'ha2;
			8'h1b: subByte=8'haf;
			8'h1c: subByte=8'h9c;
			8'h1d: subByte=8'ha4;
			8'h1e: subByte=8'h72;
			8'h1f: subByte=8'hc0;
			8'h20: subByte=8'hb7;
			8'h21: subByte=8'hfd;
			8'h22: subByte=8'h93;
			8'h23: subByte=8'h26;
			8'h24: subByte=8'h36;
			8'h25: subByte=8'h3f;
			8'h26: subByte=8'hf7;
			8'h27: subByte=8'hcc;
			8'h28: subByte=8'h34;
			8'h29: subByte=8'ha5;
			8'h2a: subByte=8'he5;
			8'h2b: subByte=8'hf1;
			8'h2c: subByte=8'h71;
			8'h2d: subByte=8'hd8;
			8'h2e: subByte=8'h31;
			8'h2f: subByte=8'h15;
			8'h30: subByte=8'h04;
			8'h31: subByte=8'hc7;
			8'h32: subByte=8'h23;
			8'h33: subByte=8'hc3;
			8'h34: subByte=8'h18;
			8'h35: subByte=8'h96;
			8'h36: subByte=8'h05;
			8'h37: subByte=8'h9a;
			8'h38: subByte=8'h07;
			8'h39: subByte=8'h12;
			8'h3a: subByte=8'h80;
			8'h3b: subByte=8'he2;
			8'h3c: subByte=8'heb;
			8'h3d: subByte=8'h27;
			8'h3e: subByte=8'hb2;
			8'h3f: subByte=8'h75;
			8'h40: subByte=8'h09;
			8'h41: subByte=8'h83;
			8'h42: subByte=8'h2c;
			8'h43: subByte=8'h1a;
			8'h44: subByte=8'h1b;
			8'h45: subByte=8'h6e;
			8'h46: subByte=8'h5a;
			8'h47: subByte=8'ha0;
			8'h48: subByte=8'h52;
			8'h49: subByte=8'h3b;
			8'h4a: subByte=8'hd6;
			8'h4b: subByte=8'hb3;
			8'h4c: subByte=8'h29;
			8'h4d: subByte=8'he3;
			8'h4e: subByte=8'h2f;
			8'h4f: subByte=8'h84;
			8'h50: subByte=8'h53;
			8'h51: subByte=8'hd1;
			8'h52: subByte=8'h00;
			8'h53: subByte=8'hed;
			8'h54: subByte=8'h20;
			8'h55: subByte=8'hfc;
			8'h56: subByte=8'hb1;
			8'h57: subByte=8'h5b;
			8'h58: subByte=8'h6a;
			8'h59: subByte=8'hcb;
			8'h5a: subByte=8'hbe;
			8'h5b: subByte=8'h39;
			8'h5c: subByte=8'h4a;
			8'h5d: subByte=8'h4c;
			8'h5e: subByte=8'h58;
			8'h5f: subByte=8'hcf;
			8'h60: subByte=8'hd0;
			8'h61: subByte=8'hef;
			8'h62: subByte=8'haa;
			8'h63: subByte=8'hfb;
			8'h64: subByte=8'h43;
			8'h65: subByte=8'h4d;
			8'h66: subByte=8'h33;
			8'h67: subByte=8'h85;
			8'h68: subByte=8'h45;
			8'h69: subByte=8'hf9;
			8'h6a: subByte=8'h02;
			8'h6b: subByte=8'h7f;
			8'h6c: subByte=8'h50;
			8'h6d: subByte=8'h3c;
			8'h6e: subByte=8'h9f;
			8'h6f: subByte=8'ha8;
			8'h70: subByte=8'h51;
			8'h71: subByte=8'ha3;
			8'h72: subByte=8'h40;
			8'h73: subByte=8'h8f;
			8'h74: subByte=8'h92;
			8'h75: subByte=8'h9d;
			8'h76: subByte=8'h38;
			8'h77: subByte=8'hf5;
			8'h78: subByte=8'hbc;
			8'h79: subByte=8'hb6;
			8'h7a: subByte=8'hda;
			8'h7b: subByte=8'h21;
			8'h7c: subByte=8'h10;
			8'h7d: subByte=8'hff;
			8'h7e: subByte=8'hf3;
			8'h7f: subByte=8'hd2;
			8'h80: subByte=8'hcd;
			8'h81: subByte=8'h0c;
			8'h82: subByte=8'h13;
			8'h83: subByte=8'hec;
			8'h84: subByte=8'h5f;
			8'h85: subByte=8'h97;
			8'h86: subByte=8'h44;
			8'h87: subByte=8'h17;
			8'h88: subByte=8'hc4;
			8'h89: subByte=8'ha7;
			8'h8a: subByte=8'h7e;
			8'h8b: subByte=8'h3d;
			8'h8c: subByte=8'h64;
			8'h8d: subByte=8'h5d;
			8'h8e: subByte=8'h19;
			8'h8f: subByte=8'h73;
			8'h90: subByte=8'h60;
			8'h91: subByte=8'h81;
			8'h92: subByte=8'h4f;
			8'h93: subByte=8'hdc;
			8'h94: subByte=8'h22;
			8'h95: subByte=8'h2a;
			8'h96: subByte=8'h90;
			8'h97: subByte=8'h88;
			8'h98: subByte=8'h46;
			8'h99: subByte=8'hee;
			8'h9a: subByte=8'hb8;
			8'h9b: subByte=8'h14;
			8'h9c: subByte=8'hde;
			8'h9d: subByte=8'h5e;
			8'h9e: subByte=8'h0b;
			8'h9f: subByte=8'hdb;
			8'ha0: subByte=8'he0;
			8'ha1: subByte=8'h32;
			8'ha2: subByte=8'h3a;
			8'ha3: subByte=8'h0a;
			8'ha4: subByte=8'h49;
			8'ha5: subByte=8'h06;
			8'ha6: subByte=8'h24;
			8'ha7: subByte=8'h5c;
			8'ha8: subByte=8'hc2;
			8'ha9: subByte=8'hd3;
			8'haa: subByte=8'hac;
			8'hab: subByte=8'h62;
			8'hac: subByte=8'h91;
			8'had: subByte=8'h95;
			8'hae: subByte=8'he4;
			8'haf: subByte=8'h79;
			8'hb0: subByte=8'he7;
			8'hb1: subByte=8'hc8;
			8'hb2: subByte=8'h37;
			8'hb3: subByte=8'h6d;
			8'hb4: subByte=8'h8d;
			8'hb5: subByte=8'hd5;
			8'hb6: subByte=8'h4e;
			8'hb7: subByte=8'ha9;
			8'hb8: subByte=8'h6c;
			8'hb9: subByte=8'h56;
			8'hba: subByte=8'hf4;
			8'hbb: subByte=8'hea;
			8'hbc: subByte=8'h65;
			8'hbd: subByte=8'h7a;
			8'hbe: subByte=8'hae;
			8'hbf: subByte=8'h08;
			8'hc0: subByte=8'hba;
			8'hc1: subByte=8'h78;
			8'hc2: subByte=8'h25;
			8'hc3: subByte=8'h2e;
			8'hc4: subByte=8'h1c;
			8'hc5: subByte=8'ha6;
			8'hc6: subByte=8'hb4;
			8'hc7: subByte=8'hc6;
			8'hc8: subByte=8'he8;
			8'hc9: subByte=8'hdd;
			8'hca: subByte=8'h74;
			8'hcb: subByte=8'h1f;
			8'hcc: subByte=8'h4b;
			8'hcd: subByte=8'hbd;
			8'hce: subByte=8'h8b;
			8'hcf: subByte=8'h8a;
			8'hd0: subByte=8'h70;
			8'hd1: subByte=8'h3e;
			8'hd2: subByte=8'hb5;
			8'hd3: subByte=8'h66;
			8'hd4: subByte=8'h48;
			8'hd5: subByte=8'h03;
			8'hd6: subByte=8'hf6;
			8'hd7: subByte=8'h0e;
			8'hd8: subByte=8'h61;
			8'hd9: subByte=8'h35;
			8'hda: subByte=8'h57;
			8'hdb: subByte=8'hb9;
			8'hdc: subByte=8'h86;
			8'hdd: subByte=8'hc1;
			8'hde: subByte=8'h1d;
			8'hdf: subByte=8'h9e;
			8'he0: subByte=8'he1;
			8'he1: subByte=8'hf8;
			8'he2: subByte=8'h98;
			8'he3: subByte=8'h11;
			8'he4: subByte=8'h69;
			8'he5: subByte=8'hd9;
			8'he6: subByte=8'h8e;
			8'he7: subByte=8'h94;
			8'he8: subByte=8'h9b;
			8'he9: subByte=8'h1e;
			8'hea: subByte=8'h87;
			8'heb: subByte=8'he9;
			8'hec: subByte=8'hce;
			8'hed: subByte=8'h55;
			8'hee: subByte=8'h28;
			8'hef: subByte=8'hdf;
			8'hf0: subByte=8'h8c;
			8'hf1: subByte=8'ha1;
			8'hf2: subByte=8'h89;
			8'hf3: subByte=8'h0d;
			8'hf4: subByte=8'hbf;
			8'hf5: subByte=8'he6;
			8'hf6: subByte=8'h42;
			8'hf7: subByte=8'h68;
			8'hf8: subByte=8'h41;
			8'hf9: subByte=8'h99;
			8'hfa: subByte=8'h2d;
			8'hfb: subByte=8'h0f;
			8'hfc: subByte=8'hb0;
			8'hfd: subByte=8'h54;
			8'hfe: subByte=8'hbb;
			8'hff: subByte=8'h16;
		endcase
	end
endmodule


module InvSubTable(subByte, oriByte);
	input [7:0] subByte; 
	output reg [7:0] oriByte;

	always @(*) begin  
		case (subByte)
			8'h00: oriByte =8'h52;
			8'h01: oriByte =8'h09;
			8'h02: oriByte =8'h6a;
			8'h03: oriByte =8'hd5;
			8'h04: oriByte =8'h30;
			8'h05: oriByte =8'h36;
			8'h06: oriByte =8'ha5;
			8'h07: oriByte =8'h38;
			8'h08: oriByte =8'hbf;
			8'h09: oriByte =8'h40;
			8'h0a: oriByte =8'ha3;
			8'h0b: oriByte =8'h9e;
			8'h0c: oriByte =8'h81;
			8'h0d: oriByte =8'hf3;
			8'h0e: oriByte =8'hd7;
			8'h0f: oriByte =8'hfb;
			8'h10: oriByte =8'h7c;
			8'h11: oriByte =8'he3;
			8'h12: oriByte =8'h39;
			8'h13: oriByte =8'h82;
			8'h14: oriByte =8'h9b;
			8'h15: oriByte =8'h2f;
			8'h16: oriByte =8'hff;
			8'h17: oriByte =8'h87;
			8'h18: oriByte =8'h34;
			8'h19: oriByte =8'h8e;
			8'h1a: oriByte =8'h43;
			8'h1b: oriByte =8'h44;
			8'h1c: oriByte =8'hc4;
			8'h1d: oriByte =8'hde;
			8'h1e: oriByte =8'he9;
			8'h1f: oriByte =8'hcb;
			8'h20: oriByte =8'h54;
			8'h21: oriByte =8'h7b;
			8'h22: oriByte =8'h94;
			8'h23: oriByte =8'h32;
			8'h24: oriByte =8'ha6;
			8'h25: oriByte =8'hc2;
			8'h26: oriByte =8'h23;
			8'h27: oriByte =8'h3d;
			8'h28: oriByte =8'hee;
			8'h29: oriByte =8'h4c;
			8'h2a: oriByte =8'h95;
			8'h2b: oriByte =8'h0b;
			8'h2c: oriByte =8'h42;
			8'h2d: oriByte =8'hfa;
			8'h2e: oriByte =8'hc3;
			8'h2f: oriByte =8'h4e;
			8'h30: oriByte =8'h08;
			8'h31: oriByte =8'h2e;
			8'h32: oriByte =8'ha1;
			8'h33: oriByte =8'h66;
			8'h34: oriByte =8'h28;
			8'h35: oriByte =8'hd9;
			8'h36: oriByte =8'h24;
			8'h37: oriByte =8'hb2;
			8'h38: oriByte =8'h76;
			8'h39: oriByte =8'h5b;
			8'h3a: oriByte =8'ha2;
			8'h3b: oriByte =8'h49;
			8'h3c: oriByte =8'h6d;
			8'h3d: oriByte =8'h8b;
			8'h3e: oriByte =8'hd1;
			8'h3f: oriByte =8'h25;
			8'h40: oriByte =8'h72;
			8'h41: oriByte =8'hf8;
			8'h42: oriByte =8'hf6;
			8'h43: oriByte =8'h64;
			8'h44: oriByte =8'h86;
			8'h45: oriByte =8'h68;
			8'h46: oriByte =8'h98;
			8'h47: oriByte =8'h16;
			8'h48: oriByte =8'hd4;
			8'h49: oriByte =8'ha4;
			8'h4a: oriByte =8'h5c;
			8'h4b: oriByte =8'hcc;
			8'h4c: oriByte =8'h5d;
			8'h4d: oriByte =8'h65;
			8'h4e: oriByte =8'hb6;
			8'h4f: oriByte =8'h92;
			8'h50: oriByte =8'h6c;
			8'h51: oriByte =8'h70;
			8'h52: oriByte =8'h48;
			8'h53: oriByte =8'h50;
			8'h54: oriByte =8'hfd;
			8'h55: oriByte =8'hed;
			8'h56: oriByte =8'hb9;
			8'h57: oriByte =8'hda;
			8'h58: oriByte =8'h5e;
			8'h59: oriByte =8'h15;
			8'h5a: oriByte =8'h46;
			8'h5b: oriByte =8'h57;
			8'h5c: oriByte =8'ha7;
			8'h5d: oriByte =8'h8d;
			8'h5e: oriByte =8'h9d;
			8'h5f: oriByte =8'h84;
			8'h60: oriByte =8'h90;
			8'h61: oriByte =8'hd8;
			8'h62: oriByte =8'hab;
			8'h63: oriByte =8'h00;
			8'h64: oriByte =8'h8c;
			8'h65: oriByte =8'hbc;
			8'h66: oriByte =8'hd3;
			8'h67: oriByte =8'h0a;
			8'h68: oriByte =8'hf7;
			8'h69: oriByte =8'he4;
			8'h6a: oriByte =8'h58;
			8'h6b: oriByte =8'h05;
			8'h6c: oriByte =8'hb8;
			8'h6d: oriByte =8'hb3;
			8'h6e: oriByte =8'h45;
			8'h6f: oriByte =8'h06;
			8'h70: oriByte =8'hd0;
			8'h71: oriByte =8'h2c;
			8'h72: oriByte =8'h1e;
			8'h73: oriByte =8'h8f;
			8'h74: oriByte =8'hca;
			8'h75: oriByte =8'h3f;
			8'h76: oriByte =8'h0f;
			8'h77: oriByte =8'h02;
			8'h78: oriByte =8'hc1;
			8'h79: oriByte =8'haf;
			8'h7a: oriByte =8'hbd;
			8'h7b: oriByte =8'h03;
			8'h7c: oriByte =8'h01;
			8'h7d: oriByte =8'h13;
			8'h7e: oriByte =8'h8a;
			8'h7f: oriByte =8'h6b;
			8'h80: oriByte =8'h3a;
			8'h81: oriByte =8'h91;
			8'h82: oriByte =8'h11;
			8'h83: oriByte =8'h41;
			8'h84: oriByte =8'h4f;
			8'h85: oriByte =8'h67;
			8'h86: oriByte =8'hdc;
			8'h87: oriByte =8'hea;
			8'h88: oriByte =8'h97;
			8'h89: oriByte =8'hf2;
			8'h8a: oriByte =8'hcf;
			8'h8b: oriByte =8'hce;
			8'h8c: oriByte =8'hf0;
			8'h8d: oriByte =8'hb4;
			8'h8e: oriByte =8'he6;
			8'h8f: oriByte =8'h73;
			8'h90: oriByte =8'h96;
			8'h91: oriByte =8'hac;
			8'h92: oriByte =8'h74;
			8'h93: oriByte =8'h22;
			8'h94: oriByte =8'he7;
			8'h95: oriByte =8'had;
			8'h96: oriByte =8'h35;
			8'h97: oriByte =8'h85;
			8'h98: oriByte =8'he2;
			8'h99: oriByte =8'hf9;
			8'h9a: oriByte =8'h37;
			8'h9b: oriByte =8'he8;
			8'h9c: oriByte =8'h1c;
			8'h9d: oriByte =8'h75;
			8'h9e: oriByte =8'hdf;
			8'h9f: oriByte =8'h6e;
			8'ha0: oriByte =8'h47;
			8'ha1: oriByte =8'hf1;
			8'ha2: oriByte =8'h1a;
			8'ha3: oriByte =8'h71;
			8'ha4: oriByte =8'h1d;
			8'ha5: oriByte =8'h29;
			8'ha6: oriByte =8'hc5;
			8'ha7: oriByte =8'h89;
			8'ha8: oriByte =8'h6f;
			8'ha9: oriByte =8'hb7;
			8'haa: oriByte =8'h62;
			8'hab: oriByte =8'h0e;
			8'hac: oriByte =8'haa;
			8'had: oriByte =8'h18;
			8'hae: oriByte =8'hbe;
			8'haf: oriByte =8'h1b;
			8'hb0: oriByte =8'hfc;
			8'hb1: oriByte =8'h56;
			8'hb2: oriByte =8'h3e;
			8'hb3: oriByte =8'h4b;
			8'hb4: oriByte =8'hc6;
			8'hb5: oriByte =8'hd2;
			8'hb6: oriByte =8'h79;
			8'hb7: oriByte =8'h20;
			8'hb8: oriByte =8'h9a;
			8'hb9: oriByte =8'hdb;
			8'hba: oriByte =8'hc0;
			8'hbb: oriByte =8'hfe;
			8'hbc: oriByte =8'h78;
			8'hbd: oriByte =8'hcd;
			8'hbe: oriByte =8'h5a;
			8'hbf: oriByte =8'hf4;
			8'hc0: oriByte =8'h1f;
			8'hc1: oriByte =8'hdd;
			8'hc2: oriByte =8'ha8;
			8'hc3: oriByte =8'h33;
			8'hc4: oriByte =8'h88;
			8'hc5: oriByte =8'h07;
			8'hc6: oriByte =8'hc7;
			8'hc7: oriByte =8'h31;
			8'hc8: oriByte =8'hb1;
			8'hc9: oriByte =8'h12;
			8'hca: oriByte =8'h10;
			8'hcb: oriByte =8'h59;
			8'hcc: oriByte =8'h27;
			8'hcd: oriByte =8'h80;
			8'hce: oriByte =8'hec;
			8'hcf: oriByte =8'h5f;
			8'hd0: oriByte =8'h60;
			8'hd1: oriByte =8'h51;
			8'hd2: oriByte =8'h7f;
			8'hd3: oriByte =8'ha9;
			8'hd4: oriByte =8'h19;
			8'hd5: oriByte =8'hb5;
			8'hd6: oriByte =8'h4a;
			8'hd7: oriByte =8'h0d;
			8'hd8: oriByte =8'h2d;
			8'hd9: oriByte =8'he5;
			8'hda: oriByte =8'h7a;
			8'hdb: oriByte =8'h9f;
			8'hdc: oriByte =8'h93;
			8'hdd: oriByte =8'hc9;
			8'hde: oriByte =8'h9c;
			8'hdf: oriByte =8'hef;
			8'he0: oriByte =8'ha0;
			8'he1: oriByte =8'he0;
			8'he2: oriByte =8'h3b;
			8'he3: oriByte =8'h4d;
			8'he4: oriByte =8'hae;
			8'he5: oriByte =8'h2a;
			8'he6: oriByte =8'hf5;
			8'he7: oriByte =8'hb0;
			8'he8: oriByte =8'hc8;
			8'he9: oriByte =8'heb;
			8'hea: oriByte =8'hbb;
			8'heb: oriByte =8'h3c;
			8'hec: oriByte =8'h83;
			8'hed: oriByte =8'h53;
			8'hee: oriByte =8'h99;
			8'hef: oriByte =8'h61;
			8'hf0: oriByte =8'h17;
			8'hf1: oriByte =8'h2b;
			8'hf2: oriByte =8'h04;
			8'hf3: oriByte =8'h7e;
			8'hf4: oriByte =8'hba;
			8'hf5: oriByte =8'h77;
			8'hf6: oriByte =8'hd6;
			8'hf7: oriByte =8'h26;
			8'hf8: oriByte =8'he1;
			8'hf9: oriByte =8'h69;
			8'hfa: oriByte =8'h14;
			8'hfb: oriByte =8'h63;
			8'hfc: oriByte =8'h55;
			8'hfd: oriByte =8'h21;
			8'hfe: oriByte =8'h0c;
			8'hff: oriByte =8'h7d;
		endcase
	end
endmodule

module SubBytes(oriBytes, subBytes);
	input [127:0] oriBytes; // Original input bytes
	output wire [127:0] subBytes; // Corresponding sub_bytes 

	genvar i;
	generate 
		for (i=7;i<128;i=i+8) begin: SubTableLoop
			SubTable s(oriBytes[i -:8],subBytes[i -:8]);
		end
	endgenerate
endmodule

module ShiftRows(in, out);
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
    assign out[119:112] = in[87:80];
    assign out[87:80] = in[55:48];
    assign out[55:48] = in[23:16];
    assign out[23:16] = in[119:112];

    // 3rd row shift 2
    assign out[111:104] = in[47:40];
    assign out[79:72] = in[15:8];
    assign out[47:40] = in[111:104];
    assign out[15:8] = in[79:72];

    // 4th row shift 3
    assign out[103:96] = in[7:0];
    assign out[71:64] = in[103:96];
    assign out[39:32] = in[71:64];
    assign out[7:0] = in[39:32];
endmodule

module MixColumns(stateIn, stateOut);
	input [127:0] stateIn;
	output [127:0] stateOut;

	// Function to multiply by 2 and fix the overflow
	function [7:0] xtime;
		input [7:0] in;
		if(in[7] == 1) xtime = (in << 1) ^ 8'h1B;
		else xtime = in << 1;
	endfunction

	genvar i;
	generate
		for(i = 0; i < 4; i = i + 1)begin: mixColumnsLoop
			// state[0,c] = 2*state[0,c] + (2 * state[1,c] + state[1,c]) + state[2,c] + state[3,c]
			assign stateOut[32*i+24+:8] =  xtime(stateIn[32*i+24+:8]) ^ (xtime(stateIn[32*i+16+:8]) ^ stateIn[32*i+16+:8]) ^ stateIn[32*i+8 +:8] ^ stateIn[32*i   +:8];
			
			// state[1,c] = 2*state[1,c] + (2 * state[2,c] + state[2,c]) + state[3,c] + state[0,c]
			assign stateOut[32*i+16+:8] =  xtime(stateIn[32*i+16+:8]) ^ (xtime(stateIn[32*i+8 +:8]) ^ stateIn[32*i+8 +:8]) ^ stateIn[32*i   +:8] ^ stateIn[32*i+24+:8];
			
			// state[2,c] = 2*state[2,c] + (2 * state[3,c] + state[3,c]) + state[0,c] + state[1,c]
			assign stateOut[32*i+8 +:8] =  xtime(stateIn[32*i+8 +:8]) ^ (xtime(stateIn[32*i   +:8]) ^ stateIn[32*i   +:8]) ^ stateIn[32*i+24+:8] ^ stateIn[32*i+16+:8];
			
			// state[3,c] = 2*state[3,c] + (2 * state[0,c] + state[0,c]) + state[1,c] + state[2,c]
			assign stateOut[32*i   +:8] =  xtime(stateIn[32*i   +:8]) ^ (xtime(stateIn[32*i+24+:8]) ^ stateIn[32*i+24+:8]) ^ stateIn[32*i+16+:8] ^ stateIn[32*i+8 +:8];
		end
	endgenerate
endmodule

module KeyExpansionRound(roundCount, keyIn, keyOut);
    input [3:0] roundCount;
    input [127:0] keyIn;

    output [127:0] keyOut;

    genvar i;

    // Split the key into 4 words
    wire [31:0] words[3:0];

    generate
        for (i = 0; i < 4; i = i + 1) begin: KeySplitLoop
            assign words[i] = keyIn[127 - i * 32 -: 32];
        end
    endgenerate

    // Rotate the words (rotWord)
    wire [31:0] w3Rot = {words[3][23:0], words[3][31:24]};

    // Perform the substitution of the words (subWord)
    wire [31:0] w3Sub;

    generate
        for (i = 0; i < 4; i = i + 1) begin: SBoxLoop
            SubTable sBox(w3Rot[i * 8 +: 8], w3Sub[i * 8 +: 8]);
        end
    endgenerate

    // Perform the XOR operation with the round constant (roundConstant)
    reg [31:0] roundConstant;
    always @(*)
    begin
        case (roundCount)
            4'h1: roundConstant = 32'h01_000000;
            4'h2: roundConstant = 32'h02_000000;
            4'h3: roundConstant = 32'h04_000000;
            4'h4: roundConstant = 32'h08_000000;
            4'h5: roundConstant = 32'h10_000000;
            4'h6: roundConstant = 32'h20_000000;
            4'h7: roundConstant = 32'h40_000000;
            4'h8: roundConstant = 32'h80_000000;
            4'h9: roundConstant = 32'h1b_000000;
            4'ha: roundConstant = 32'h36_000000;
            default: roundConstant = 32'h00_000000;
        endcase
    end

    assign keyOut[127:96] = words[0] ^ w3Sub ^ roundConstant; // XOR the first word with the round constant
    assign keyOut[95:64] = words[1] ^ keyOut[127:96]; // XOR the second word with the first word
    assign keyOut[63:32] = words[2] ^ keyOut[95:64]; // XOR the third word with the second word
    assign keyOut[31:0] = words[3] ^ keyOut[63:32]; // XOR the fourth word with the third word
endmodule

module KeyExpansion(keyIn, keysOut);    
    input [127:0] keyIn;
    output [(11 * 128) - 1:0] keysOut;

    assign keysOut[127:0] = keyIn;
    
    // Perform the key expansion rounds (KeyExpansionRound)
    genvar i;
    generate
        for (i = 0; i < 10; i = i + 1) begin : KeyExpansionLoop
            KeyExpansionRound keyExpansionRound(i[3:0] + 4'b0001, keysOut[127 + i * 128 -: 128], keysOut[255 + i * 128 -: 128]);
        end
    endgenerate
endmodule

module InvSubBytes(subBytes, oriBytes);
	input [127:0] subBytes;
	output [127:0] oriBytes;

	genvar i;
	generate 
		for (i = 7; i < 128; i = i + 8) begin: InvSubTableLoop
			InvSubTable s(subBytes[i -:8],oriBytes[i -:8]);
		end
	endgenerate
endmodule


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

module InvMixColumns(stateIn, stateOut);
	input [127:0] stateIn;
	output [127:0] stateOut;
	
	// Function to multiply by 2 and fix the overflow
	function [7:0] xtime(input [7:0] in, input integer n);
		integer i;
		begin
			for(i = 0; i < n; i = i + 1)begin
				if(in[7] == 1) in = (in << 1) ^ 8'h1B;
				else in = in << 1;
			end
			xtime = in;
		end
	endfunction

	function [7:0] mb0e; // Multiply by 0e
	input [7:0] x;
	begin
		mb0e = xtime(x,3) ^ xtime(x,2)^ xtime(x,1);
	end
	endfunction

	function [7:0] mb0d; // Multiply by 0d
	input [7:0] x;
	begin
		mb0d = xtime(x,3) ^ xtime(x,2) ^ x;
	end
	endfunction

	function [7:0] mb0b;  // Multiply by 0b
	input [7:0] x;
	begin
		mb0b = xtime(x,3) ^ xtime(x,1) ^ x;
	end
	endfunction

	function [7:0] mb09; // Multiply by 09
	input [7:0] x;
	begin
		mb09 = xtime(x,3) ^  x;
	end
	endfunction
	
	genvar i;
	generate
		for(i = 0; i < 4; i = i + 1) begin: InvMixColumnsLoop
			//state[0,c] = 0e*state[0,c] + 0b*state[1,c] + 0d*state[2,c] + 09*state[3,c]
			assign stateOut[32*i+24+:8] =  mb0e(stateIn[32*i+24+:8]) ^ mb0b(stateIn[32*i+16+:8]) ^ mb0d(stateIn[32*i+8 +:8]) ^ mb09(stateIn[32*i   +:8]);
			
			//state[1,c] = 0e*state[1,c] + 0b* state[2,c] + 0d*state[3,c] + 09*state[0,c]
			assign stateOut[32*i+16+:8] =  mb0e(stateIn[32*i+16+:8]) ^ mb0b(stateIn[32*i+8 +:8]) ^ mb0d(stateIn[32*i   +:8]) ^ mb09(stateIn[32*i+24+:8]);
			
			//state[2,c] = 0e*state[2,c] + 0b* state[3,c] + 0d*state[0,c] + 09*state[1,c]
			assign stateOut[32*i+8 +:8] =  mb0e(stateIn[32*i+8 +:8]) ^ mb0b(stateIn[32*i   +:8]) ^ mb0d(stateIn[32*i+24+:8]) ^ mb09(stateIn[32*i+16+:8]);
			
			//state[3,c] = 0e*state[3,c] + 0b* state[0,c] + 0d*state[1,c] + 09*state[2,c]
			assign stateOut[32*i   +:8] =  mb0e(stateIn[32*i   +:8]) ^ mb0b(stateIn[32*i+24+:8]) ^ mb0d(stateIn[32*i+16+:8]) ^ mb09(stateIn[32*i+8 +:8]);
		end
	endgenerate
endmodule

module DisplayDecoder(IN, out);
    input [3:0] IN;
     output reg [6:0] out;
     
    always @(IN)
        begin
            case (IN)
                    0 : out = 7'b1000000;
                    1 : out = 7'b1111001;
                    2 : out = 7'b0100100;
                    3 : out = 7'b0110000;
                    4 : out = 7'b0011001;
                    5 : out = 7'b0010010;
                    6 : out = 7'b0000010;
                    7 : out = 7'b1111000;
                    8 : out = 7'b0000000;
                    9 : out = 7'b0010000;
                    default : out = 7'b1111111; 
              endcase
        end
endmodule


module CondAdd3(in, out);
    input [3:0] in;
    output [3:0] out;

    assign out = in >= 5 ? in + 3:in;
endmodule

module Binary2BCD(in, out);
    input [7:0] in;
    output [11:0] out;
    wire [28:1] temp;

    CondAdd3 c1({1'b0,in[7:5]}, temp[4:1]);
    CondAdd3 c2({temp[3:1], in[4]}, temp[8:5]);
    CondAdd3 c3({temp[7:5], in[3]}, temp[12:9]);
    CondAdd3 c4({temp[11:9], in[2]}, temp[16:13]);
    CondAdd3 c5({temp[15:13], in[1]}, temp[20:17]);
    CondAdd3 c6({1'b0, temp[4], temp[8], temp[12]}, temp[24:21]);
    CondAdd3 c7({temp[23:21], temp[16]}, temp[28:25]);

    assign out = {1'b0, 1'b0, temp[24], temp[28:25], temp[20:17], in[0]};
endmodule

module AddRoundKey(state, roundKey, stateOut);
    input [127:0] state, roundKey;
    output [127:0] stateOut;

    assign stateOut= state ^ roundKey; 
endmodule


module AESEncrypt #(parameter Nk = 4, parameter Nr = 10) (data, allKeys, state, clk);
	input [127:0] data;
	input [(11 * 128) - 1:0] allKeys;
	input clk;

	output reg [127:0] state = 0;
	reg [3:0] roundCount = 0;

	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;
 	wire [127:0] mixColumnsWire;
 	wire  [127:0] roundKeyInput;
	wire [127:0] stateOut;

	SubBytes sub(state, subByteWire);
	ShiftRows shft(subByteWire, shiftRowsWire);	
	MixColumns mix(shiftRowsWire, mixColumnsWire);	
	AddRoundKey addkey(roundKeyInput , allKeys[(128 * roundCount) - 1 -: 128], stateOut);
	assign roundKeyInput = (roundCount == 1) ? data : 
							(roundCount < Nr + 1) ? mixColumnsWire: shiftRowsWire;

	always @(clk,data) begin
			if (roundCount == 0) begin
				state <= data;
				roundCount <= 1;
			end
			if(clk)begin
				if (roundCount <= Nr + 1)begin
					state <= stateOut;				
					roundCount <= roundCount + 1;
				end
			end
	end
endmodule


module AESDecrypt #(parameter Nk = 4, parameter Nr = 10) (data, allKeys, state, clk, enable);
	input [127:0] data;
	input [(11 * 128) - 1:0] allKeys;
	input clk;
	input enable;
	output reg [127:0] state;
	reg [3:0] roundCount = 0;
	wire [127:0] subByteWire;
	wire [127:0] shiftRowsWire;
	wire [127:0] mixColumnsWire;
	wire [127:0] afterRoundKey;
	wire [127:0] keyInput;
	wire [127:0] stateOut;

	InvShiftRows shft(state, shiftRowsWire);	
	InvSubBytes sub(shiftRowsWire, subByteWire);
	AddRoundKey addkey(keyInput, allKeys[((12 - roundCount) * 128 - 1) -: 128], afterRoundKey);
	InvMixColumns mix(afterRoundKey, mixColumnsWire);	
	assign keyInput = (roundCount == 1) ? data : subByteWire;
	assign stateOut = (roundCount > 1 && roundCount < Nr + 1) ? mixColumnsWire : afterRoundKey;

	always @(clk,data) begin
		if(enable)begin
			if (roundCount == 0) begin
				state <= data;	
				roundCount <= 1;
			end
			if(clk)begin
				if (roundCount <= Nr + 1)begin
					state <= stateOut;				
					roundCount <= roundCount + 1;
				end
			end
		end
	end
endmodule

module AES (HEX0, HEX1, HEX2, clk);
	localparam Nk =4;
	localparam Nr = 10;
    input clk;
    output [6:0] HEX0;
    output [6:0] HEX1;
    output [6:0] HEX2;
	
    // Key
    wire [127:0] key = 128'h00_01_02_03_04_05_06_07_08_09_0a_0b_0c_0d_0e_0f;

    // Key Expansion
    wire [(11 * 128) - 1:0] allKeys;
    KeyExpansion keysGetter(key, allKeys);

    // Data
    wire [127:0] data = 128'h00_11_22_33_44_55_66_77_88_99_aa_bb_cc_dd_ee_ff;

    // AES
    wire [127:0] tempEncryptedOutput;
    wire [127:0] tempDecryptedOutput;
	
    // Binary to BCD Logic
    wire [7:0] bcdInput;
    wire [11:0] bcdOutput;
	Binary2BCD b2b(bcdInput, bcdOutput);

	// 7-Segment Logic
	DisplayDecoder dd1(bcdOutput[3:0], HEX0);
    DisplayDecoder dd2(bcdOutput[7:4], HEX1);
    DisplayDecoder dd3(bcdOutput[11:8], HEX2);

    // Encrypt
    // reg AESEncryptEnable = 1'b1;
    AESEncrypt AESE(data, allKeys, tempEncryptedOutput, clk);

    // Decrypt
    reg AESDecryptEnable = 1'b0;
    AESDecrypt AESD(tempEncryptedOutput, allKeys, tempDecryptedOutput, clk,AESDecryptEnable);

    reg [5:0] count = 1;
    // always @(posedge clk) begin
    //     if (AESEncryptEnable || AESDecryptEnable)
    //         count <= count + 1;
    // end

	assign bcdInput = (count <= Nr + 2) ? tempEncryptedOutput[7:0] : tempDecryptedOutput[7:0];

    always @(posedge clk) begin
        if (count == Nr + 1) begin
            AESDecryptEnable = 1'b1;
        end
        else if (count == ((Nr + 1) * 2)) begin
            AESDecryptEnable = 1'b0;
        end
		count <= count + 1;
    end
endmodule




// module Encrypt_DUT();
// 	reg clk;
// 	wire [127:0] key = 128'h00_01_02_03_04_05_06_07_08_09_0a_0b_0c_0d_0e_0f;
// 	wire [127:0] data = 128'h00_11_22_33_44_55_66_77_88_99_aa_bb_cc_dd_ee_ff;
// 	wire [127:0] out;
// 	wire [127:0] encrypted;
// 	reg [4:0]counter = 1;
// 	reg enabled = 1'b0;
// 	wire [(11 * 128) - 1:0] allKeys;
//     KeyExpansion keysGetter(key, allKeys);
// 	AESEncrypt enc(data,allKeys,encrypted,clk);
// 	AESDecrypt dec(encrypted,allKeys,out,clk,enabled);
// 	initial begin
// 		clk = 0;
// 	forever	#5 clk = ~clk;
// 	end

// 	always@(posedge clk)begin
// 		counter <=counter + 1;
// 		if(counter == 11)
// 			enabled = 1'b1;
// 	end

// endmodule

