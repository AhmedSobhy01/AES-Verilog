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

module KeyExpansion_DUT();
    reg [127:0] keyIn;
    wire [(11 * 128) - 1:0] keysOut;

    KeyExpansion keyExpansion(keyIn, keysOut);

    initial begin
        keyIn = 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c; // 128-bit key from the AES standard document
    end

    initial begin
        $display("KeyExpansion_DUT");
        $display("==================================");
        $display("keyIn = %h", keyIn);
        $monitor("keysOut = %h, %h, %h, %h, %h, %h, %h, %h, %h, %h, %h", keysOut[127:0], keysOut[255:128], keysOut[383:256], keysOut[511:384], keysOut[639:512], keysOut[767:640], keysOut[895:768], keysOut[1023:896], keysOut[1151:1024], keysOut[1279:1152], keysOut[1407:1280]);
    end
endmodule