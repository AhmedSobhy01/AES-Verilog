module KeyExpansionRound #(parameter Nk = 4, parameter Nr = 10) (roundCount, keyIn, keyOut);
    input [3:0] roundCount;
    input [32 * Nk - 1:0] keyIn;

    output [32 * Nk - 1:0] keyOut;

    genvar i;

    // Split the key into Nk words
    wire [31:0] words[Nk - 1:0];

    generate
        for (i = 0; i < Nk; i = i + 1) begin: KeySplitLoop
            assign words[i] = keyIn[(32 * Nk - 1) - i * 32 -: 32];
        end
    endgenerate

    // Rotate the words (rotWord)
    wire [31:0] w3Rot = {words[Nk - 1][23:0], words[Nk - 1][31:24]};

    // Perform the substitution of the words (subWord)
    wire [31:0] w3Sub;

    generate 
        for (i = 0; i < 4; i = i + 1) begin: SubWordLoop
            SubTable subTable(w3Rot[8 * i +: 8], w3Sub[8 * i +: 8]);
        end
    endgenerate

    // Perform the XOR operation with the round constant (roundConstant)
    wire [7:0] roundConstantStart = roundCount == 1 ? 8'h01
                                        : roundCount == 2 ? 8'h02
                                        : roundCount == 3 ? 8'h04
                                        : roundCount == 4 ? 8'h08
                                        : roundCount == 5 ? 8'h10
                                        : roundCount == 6 ? 8'h20
                                        : roundCount == 7 ? 8'h40
                                        : roundCount == 8 ? 8'h80
                                        : roundCount == 9 ? 8'h1b
                                        : roundCount == 10 ? 8'h36
                                        : roundCount == 11 ? 8'h6c
                                        : roundCount == 12 ? 8'hd8
                                        : roundCount == 13 ? 8'hab
                                        : roundCount == 14 ? 8'h4d
                                        : roundCount == 15 ? 8'h9a
                                        : roundCount == 16 ? 8'h2f
                                        : 8'h00;
    wire [31:0] roundConstant = {roundConstantStart, 24'h00};

    assign keyOut[32 * Nk - 1 -: 32] = words[0] ^ w3Sub ^ roundConstant; // XOR the first word with the round constant

    // Perform SubWord transformation for i % Nk work (256 bits key only)
    wire [31:0] wSub;
    generate 
        for (i = 0; i < 4; i = i + 1) begin: SubWordLoopForWSub
            SubTable subTable(keyOut[(32 * Nk - 1) - 3 * 32 - i * 8 -: 8], wSub[(3 - i) * 8 +: 8]);
        end
    endgenerate

    generate
        for (i = 1; i < Nk; i = i + 1) begin: KeyExpansionLoop
            assign keyOut[(32 * Nk - 1) - i * 32 -: 32] = words[i] ^ (Nk == 8 && i == 4 ? wSub : keyOut[(32 * Nk - 1) - (i - 1) * 32 -: 32]); // XOR word i with word i - 1
        end
    endgenerate
endmodule

module KeyExpansion #(parameter Nk = 4, parameter Nr = 10) (keyIn, keysOut);    
    localparam rounds = (Nr == 10 ? 9 : (Nr == 12 ? 7 : 6));

    input [(Nk * 32) - 1:0] keyIn;
    output  [((Nr + 1) * 128) - 1:0] keysOut;

    assign keysOut[((Nr + 1) * 128) - 1 -: (Nk * 32)] = keyIn;

    // Perform the key expansion rounds (KeyExpansionRound)
    genvar i;
    generate
        for (i = 0; i < rounds; i = i + 1) begin: KeyExpansionRoundLoop
            KeyExpansionRound #(Nk, Nr) keyExpansionRound(i[3:0] + 4'b0001, keysOut[((Nr + 1) * 128) - 1 - i * (Nk * 32) -: (Nk * 32)], keysOut[((Nr + 1) * 128) - 1 - (i + 1) * (Nk * 32) -: (Nk * 32)]);
        end
    endgenerate

    // Perform the last key expansion round (LastKeyExpansionRound)
    wire [Nk * 32 - 1:0] lastkey;
    KeyExpansionRound #(Nk, Nr) lastKeyExpansionRound(rounds[3:0] + 4'b0001, keysOut[128 +: (Nk * 32)], lastkey);

    assign keysOut[127:0] = lastkey[Nk * 32 - 1 -: 128];
endmodule

module KeyExpansion128_DUT();
    localparam Nr = 10;
    localparam Nk = 4;
    localparam rounds = (Nr == 10 ? 9 : (Nr == 12 ? 7 : 6));

    reg [(Nk * 32) - 1:0] keyIn;
    wire [((Nr + 1) * 128) - 1:0] keysOut;

    KeyExpansion #(Nk, Nr) keyExpansion(keyIn, keysOut);

    initial begin
        keyIn = 128'h2b_7e_15_16_28_ae_d2_a6_ab_f7_15_88_09_cf_4f_3c; // 128-bit key from the AES standard document
    end

    integer i;

    initial begin
        $display("KeyExpansion128_DUT");
        $display("==================================");
        $display("keyIn = %h", keyIn);
        #10;

        for (i = 0; i <= rounds; i = i + 1) begin: DisplayKeys
            $display("keysOut[%0d] = %h", i, keysOut[((Nr + 1) * 128) - 1 - i * (Nk * 32) -: (Nk * 32)]);
        end
    end
endmodule

module KeyExpansion192_DUT();
    localparam Nr = 12;
    localparam Nk = 6;
    localparam rounds = (Nr == 10 ? 9 : (Nr == 12 ? 7 : 6));

    reg [(Nk * 32) - 1:0] keyIn;
    wire [((Nr + 1) * 128) - 1:0] keysOut;

    KeyExpansion #(Nk, Nr) keyExpansion (keyIn, keysOut);

    initial begin
        keyIn = 192'h8e_73_b0_f7_da_0e_64_52_c8_10_f3_2b_80_90_79_e5_62_f8_ea_d2_52_2c_6b_7b; // 192-bit key from the AES standard document
    end

    integer i;

    initial begin
        $display("KeyExpansion196_DUT");
        $display("==================================");
        $display("keyIn = %h", keyIn);
        #10;

        for (i = 0; i <= rounds; i = i + 1) begin: DisplayKeys
            $display("keysOut[%0d] = %h", i, keysOut[((Nr + 1) * 128) - 1 - i * (Nk * 32) -: (Nk * 32)]);
        end
        $display("keysOut[%0d] = %h", rounds + 1, keysOut[127:0]);
    end
endmodule

module KeyExpansion256_DUT();
    localparam Nr = 14;
    localparam Nk = 8;
    localparam rounds = (Nr == 10 ? 9 : (Nr == 12 ? 7 : 6));

    reg [(Nk * 32) - 1:0] keyIn;
    wire [((Nr + 1) * 128) - 1:0] keysOut;

    KeyExpansion #(Nk, Nr) keyExpansion (keyIn, keysOut);

    initial begin
        keyIn = 256'h60_3d_eb_10_15_ca_71_be_2b_73_ae_f0_85_7d_77_81_1f_35_2c_07_3b_61_08_d7_2d_98_10_a3_09_14_df_f4; // 256-bit key from the AES standard document
    end

    integer i;

    initial begin
        $display("KeyExpansion256_DUT");
        $display("==================================");
        $display("keyIn = %h", keyIn);
        #10;

        for (i = 0; i <= rounds; i = i + 1) begin: DisplayKeys
            $display("keysOut[%0d] = %h", i, keysOut[((Nr + 1) * 128) - 1 - i * (Nk * 32) -: (Nk * 32)]);
        end
        $display("keysOut[%0d] = %h", rounds + 1, keysOut[127:0]);
    end
endmodule