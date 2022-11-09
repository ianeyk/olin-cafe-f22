`timescale 1ns/1ps
`default_nettype none
`include "./mux2.sv"

module mux34(a, s, y);

    input [33:0] a;
    input [5:0] s;
    output logic y; // single bit output of mux
    
    logic [63:0] a2; // length n2
    always_comb a2 = {{58{1'b0}}, a};
    logic [1:0] y_layer6_0;
        logic [1:0] y_layer5_00;
            logic [1:0] y_layer4_000;
                logic [1:0] y_layer3_0000;
                    logic [1:0] y_layer2_00000;
                        logic [1:0] y_layer1_000000;
                            always_comb y_layer1_000000[0] = a2[0]; // wire
                            always_comb y_layer1_000000[1] = a2[1]; // wire
                        mux2 mux_layer1_000000(.a(y_layer1_000000), .s(s[0]), .y(y_layer2_00000[0]));
                        logic [1:0] y_layer1_000001;
                            always_comb y_layer1_000001[0] = a2[2]; // wire
                            always_comb y_layer1_000001[1] = a2[3]; // wire
                        mux2 mux_layer1_000001(.a(y_layer1_000001), .s(s[0]), .y(y_layer2_00000[1]));
                    mux2 mux_layer2_00000 (.a(y_layer2_00000), .s(s[1]), .y(y_layer3_0000[0]));
                    logic [1:0] y_layer2_00001;
                        logic [1:0] y_layer1_000010;
                            always_comb y_layer1_000010[0] = a2[4]; // wire
                            always_comb y_layer1_000010[1] = a2[5]; // wire
                        mux2 mux_layer1_000010(.a(y_layer1_000010), .s(s[0]), .y(y_layer2_00001[0]));
                        logic [1:0] y_layer1_000011;
                            always_comb y_layer1_000011[0] = a2[6]; // wire
                            always_comb y_layer1_000011[1] = a2[7]; // wire
                        mux2 mux_layer1_000011(.a(y_layer1_000011), .s(s[0]), .y(y_layer2_00001[1]));
                    mux2 mux_layer2_00001 (.a(y_layer2_00001), .s(s[1]), .y(y_layer3_0000[1]));
                mux2 mux_layer3_0000  (.a(y_layer3_0000), .s(s[2]), .y(y_layer4_000[0]));
                logic [1:0] y_layer3_0001;
                    logic [1:0] y_layer2_00010;
                        logic [1:0] y_layer1_000100;
                            always_comb y_layer1_000100[0] = a2[8]; // wire
                            always_comb y_layer1_000100[1] = a2[9]; // wire
                        mux2 mux_layer1_000100(.a(y_layer1_000100), .s(s[0]), .y(y_layer2_00010[0]));
                        logic [1:0] y_layer1_000101;
                            always_comb y_layer1_000101[0] = a2[10]; // wire
                            always_comb y_layer1_000101[1] = a2[11]; // wire
                        mux2 mux_layer1_000101(.a(y_layer1_000101), .s(s[0]), .y(y_layer2_00010[1]));
                    mux2 mux_layer2_00010 (.a(y_layer2_00010), .s(s[1]), .y(y_layer3_0001[0]));
                    logic [1:0] y_layer2_00011;
                        logic [1:0] y_layer1_000110;
                            always_comb y_layer1_000110[0] = a2[12]; // wire
                            always_comb y_layer1_000110[1] = a2[13]; // wire
                        mux2 mux_layer1_000110(.a(y_layer1_000110), .s(s[0]), .y(y_layer2_00011[0]));
                        logic [1:0] y_layer1_000111;
                            always_comb y_layer1_000111[0] = a2[14]; // wire
                            always_comb y_layer1_000111[1] = a2[15]; // wire
                        mux2 mux_layer1_000111(.a(y_layer1_000111), .s(s[0]), .y(y_layer2_00011[1]));
                    mux2 mux_layer2_00011 (.a(y_layer2_00011), .s(s[1]), .y(y_layer3_0001[1]));
                mux2 mux_layer3_0001  (.a(y_layer3_0001), .s(s[2]), .y(y_layer4_000[1]));
            mux2 mux_layer4_000   (.a(y_layer4_000), .s(s[3]), .y(y_layer5_00[0]));
            logic [1:0] y_layer4_001;
                logic [1:0] y_layer3_0010;
                    logic [1:0] y_layer2_00100;
                        logic [1:0] y_layer1_001000;
                            always_comb y_layer1_001000[0] = a2[16]; // wire
                            always_comb y_layer1_001000[1] = a2[17]; // wire
                        mux2 mux_layer1_001000(.a(y_layer1_001000), .s(s[0]), .y(y_layer2_00100[0]));
                        logic [1:0] y_layer1_001001;
                            always_comb y_layer1_001001[0] = a2[18]; // wire
                            always_comb y_layer1_001001[1] = a2[19]; // wire
                        mux2 mux_layer1_001001(.a(y_layer1_001001), .s(s[0]), .y(y_layer2_00100[1]));
                    mux2 mux_layer2_00100 (.a(y_layer2_00100), .s(s[1]), .y(y_layer3_0010[0]));
                    logic [1:0] y_layer2_00101;
                        logic [1:0] y_layer1_001010;
                            always_comb y_layer1_001010[0] = a2[20]; // wire
                            always_comb y_layer1_001010[1] = a2[21]; // wire
                        mux2 mux_layer1_001010(.a(y_layer1_001010), .s(s[0]), .y(y_layer2_00101[0]));
                        logic [1:0] y_layer1_001011;
                            always_comb y_layer1_001011[0] = a2[22]; // wire
                            always_comb y_layer1_001011[1] = a2[23]; // wire
                        mux2 mux_layer1_001011(.a(y_layer1_001011), .s(s[0]), .y(y_layer2_00101[1]));
                    mux2 mux_layer2_00101 (.a(y_layer2_00101), .s(s[1]), .y(y_layer3_0010[1]));
                mux2 mux_layer3_0010  (.a(y_layer3_0010), .s(s[2]), .y(y_layer4_001[0]));
                logic [1:0] y_layer3_0011;
                    logic [1:0] y_layer2_00110;
                        logic [1:0] y_layer1_001100;
                            always_comb y_layer1_001100[0] = a2[24]; // wire
                            always_comb y_layer1_001100[1] = a2[25]; // wire
                        mux2 mux_layer1_001100(.a(y_layer1_001100), .s(s[0]), .y(y_layer2_00110[0]));
                        logic [1:0] y_layer1_001101;
                            always_comb y_layer1_001101[0] = a2[26]; // wire
                            always_comb y_layer1_001101[1] = a2[27]; // wire
                        mux2 mux_layer1_001101(.a(y_layer1_001101), .s(s[0]), .y(y_layer2_00110[1]));
                    mux2 mux_layer2_00110 (.a(y_layer2_00110), .s(s[1]), .y(y_layer3_0011[0]));
                    logic [1:0] y_layer2_00111;
                        logic [1:0] y_layer1_001110;
                            always_comb y_layer1_001110[0] = a2[28]; // wire
                            always_comb y_layer1_001110[1] = a2[29]; // wire
                        mux2 mux_layer1_001110(.a(y_layer1_001110), .s(s[0]), .y(y_layer2_00111[0]));
                        logic [1:0] y_layer1_001111;
                            always_comb y_layer1_001111[0] = a2[30]; // wire
                            always_comb y_layer1_001111[1] = a2[31]; // wire
                        mux2 mux_layer1_001111(.a(y_layer1_001111), .s(s[0]), .y(y_layer2_00111[1]));
                    mux2 mux_layer2_00111 (.a(y_layer2_00111), .s(s[1]), .y(y_layer3_0011[1]));
                mux2 mux_layer3_0011  (.a(y_layer3_0011), .s(s[2]), .y(y_layer4_001[1]));
            mux2 mux_layer4_001   (.a(y_layer4_001), .s(s[3]), .y(y_layer5_00[1]));
        mux2 mux_layer5_00    (.a(y_layer5_00), .s(s[4]), .y(y_layer6_0[0]));
        logic [1:0] y_layer5_01;
            logic [1:0] y_layer4_010;
                logic [1:0] y_layer3_0100;
                    logic [1:0] y_layer2_01000;
                        logic [1:0] y_layer1_010000;
                            always_comb y_layer1_010000[0] = a2[32]; // wire
                            always_comb y_layer1_010000[1] = a2[33]; // wire
                        mux2 mux_layer1_010000(.a(y_layer1_010000), .s(s[0]), .y(y_layer2_01000[0]));
                        logic [1:0] y_layer1_010001;
                            always_comb y_layer1_010001[0] = a2[34]; // wire
                            always_comb y_layer1_010001[1] = a2[35]; // wire
                        mux2 mux_layer1_010001(.a(y_layer1_010001), .s(s[0]), .y(y_layer2_01000[1]));
                    mux2 mux_layer2_01000 (.a(y_layer2_01000), .s(s[1]), .y(y_layer3_0100[0]));
                    logic [1:0] y_layer2_01001;
                        logic [1:0] y_layer1_010010;
                            always_comb y_layer1_010010[0] = a2[36]; // wire
                            always_comb y_layer1_010010[1] = a2[37]; // wire
                        mux2 mux_layer1_010010(.a(y_layer1_010010), .s(s[0]), .y(y_layer2_01001[0]));
                        logic [1:0] y_layer1_010011;
                            always_comb y_layer1_010011[0] = a2[38]; // wire
                            always_comb y_layer1_010011[1] = a2[39]; // wire
                        mux2 mux_layer1_010011(.a(y_layer1_010011), .s(s[0]), .y(y_layer2_01001[1]));
                    mux2 mux_layer2_01001 (.a(y_layer2_01001), .s(s[1]), .y(y_layer3_0100[1]));
                mux2 mux_layer3_0100  (.a(y_layer3_0100), .s(s[2]), .y(y_layer4_010[0]));
                logic [1:0] y_layer3_0101;
                    logic [1:0] y_layer2_01010;
                        logic [1:0] y_layer1_010100;
                            always_comb y_layer1_010100[0] = a2[40]; // wire
                            always_comb y_layer1_010100[1] = a2[41]; // wire
                        mux2 mux_layer1_010100(.a(y_layer1_010100), .s(s[0]), .y(y_layer2_01010[0]));
                        logic [1:0] y_layer1_010101;
                            always_comb y_layer1_010101[0] = a2[42]; // wire
                            always_comb y_layer1_010101[1] = a2[43]; // wire
                        mux2 mux_layer1_010101(.a(y_layer1_010101), .s(s[0]), .y(y_layer2_01010[1]));
                    mux2 mux_layer2_01010 (.a(y_layer2_01010), .s(s[1]), .y(y_layer3_0101[0]));
                    logic [1:0] y_layer2_01011;
                        logic [1:0] y_layer1_010110;
                            always_comb y_layer1_010110[0] = a2[44]; // wire
                            always_comb y_layer1_010110[1] = a2[45]; // wire
                        mux2 mux_layer1_010110(.a(y_layer1_010110), .s(s[0]), .y(y_layer2_01011[0]));
                        logic [1:0] y_layer1_010111;
                            always_comb y_layer1_010111[0] = a2[46]; // wire
                            always_comb y_layer1_010111[1] = a2[47]; // wire
                        mux2 mux_layer1_010111(.a(y_layer1_010111), .s(s[0]), .y(y_layer2_01011[1]));
                    mux2 mux_layer2_01011 (.a(y_layer2_01011), .s(s[1]), .y(y_layer3_0101[1]));
                mux2 mux_layer3_0101  (.a(y_layer3_0101), .s(s[2]), .y(y_layer4_010[1]));
            mux2 mux_layer4_010   (.a(y_layer4_010), .s(s[3]), .y(y_layer5_01[0]));
            logic [1:0] y_layer4_011;
                logic [1:0] y_layer3_0110;
                    logic [1:0] y_layer2_01100;
                        logic [1:0] y_layer1_011000;
                            always_comb y_layer1_011000[0] = a2[48]; // wire
                            always_comb y_layer1_011000[1] = a2[49]; // wire
                        mux2 mux_layer1_011000(.a(y_layer1_011000), .s(s[0]), .y(y_layer2_01100[0]));
                        logic [1:0] y_layer1_011001;
                            always_comb y_layer1_011001[0] = a2[50]; // wire
                            always_comb y_layer1_011001[1] = a2[51]; // wire
                        mux2 mux_layer1_011001(.a(y_layer1_011001), .s(s[0]), .y(y_layer2_01100[1]));
                    mux2 mux_layer2_01100 (.a(y_layer2_01100), .s(s[1]), .y(y_layer3_0110[0]));
                    logic [1:0] y_layer2_01101;
                        logic [1:0] y_layer1_011010;
                            always_comb y_layer1_011010[0] = a2[52]; // wire
                            always_comb y_layer1_011010[1] = a2[53]; // wire
                        mux2 mux_layer1_011010(.a(y_layer1_011010), .s(s[0]), .y(y_layer2_01101[0]));
                        logic [1:0] y_layer1_011011;
                            always_comb y_layer1_011011[0] = a2[54]; // wire
                            always_comb y_layer1_011011[1] = a2[55]; // wire
                        mux2 mux_layer1_011011(.a(y_layer1_011011), .s(s[0]), .y(y_layer2_01101[1]));
                    mux2 mux_layer2_01101 (.a(y_layer2_01101), .s(s[1]), .y(y_layer3_0110[1]));
                mux2 mux_layer3_0110  (.a(y_layer3_0110), .s(s[2]), .y(y_layer4_011[0]));
                logic [1:0] y_layer3_0111;
                    logic [1:0] y_layer2_01110;
                        logic [1:0] y_layer1_011100;
                            always_comb y_layer1_011100[0] = a2[56]; // wire
                            always_comb y_layer1_011100[1] = a2[57]; // wire
                        mux2 mux_layer1_011100(.a(y_layer1_011100), .s(s[0]), .y(y_layer2_01110[0]));
                        logic [1:0] y_layer1_011101;
                            always_comb y_layer1_011101[0] = a2[58]; // wire
                            always_comb y_layer1_011101[1] = a2[59]; // wire
                        mux2 mux_layer1_011101(.a(y_layer1_011101), .s(s[0]), .y(y_layer2_01110[1]));
                    mux2 mux_layer2_01110 (.a(y_layer2_01110), .s(s[1]), .y(y_layer3_0111[0]));
                    logic [1:0] y_layer2_01111;
                        logic [1:0] y_layer1_011110;
                            always_comb y_layer1_011110[0] = a2[60]; // wire
                            always_comb y_layer1_011110[1] = a2[61]; // wire
                        mux2 mux_layer1_011110(.a(y_layer1_011110), .s(s[0]), .y(y_layer2_01111[0]));
                        logic [1:0] y_layer1_011111;
                            always_comb y_layer1_011111[0] = a2[62]; // wire
                            always_comb y_layer1_011111[1] = a2[63]; // wire
                        mux2 mux_layer1_011111(.a(y_layer1_011111), .s(s[0]), .y(y_layer2_01111[1]));
                    mux2 mux_layer2_01111 (.a(y_layer2_01111), .s(s[1]), .y(y_layer3_0111[1]));
                mux2 mux_layer3_0111  (.a(y_layer3_0111), .s(s[2]), .y(y_layer4_011[1]));
            mux2 mux_layer4_011   (.a(y_layer4_011), .s(s[3]), .y(y_layer5_01[1]));
        mux2 mux_layer5_01    (.a(y_layer5_01), .s(s[4]), .y(y_layer6_0[1]));
    mux2 mux_layer6_0     (.a(y_layer6_0), .s(s[5]), .y(y));
    
endmodule
