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