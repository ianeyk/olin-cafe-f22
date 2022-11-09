`timescale 1ns/1ps
`default_nettype none
`include "./mux2.sv"

module mux29(a, s, y);

    input [28:0] a;
    input [4:0] s;
    output logic y; // single bit output of mux
    
    logic [31:0] a2; // length n2
    always_comb a2 = {{27{1'b0}}, a};
    logic [1:0] y_layer5_0;
        logic [1:0] y_layer4_00;
            logic [1:0] y_layer3_000;
                logic [1:0] y_layer2_0000;
                    logic [1:0] y_layer1_00000;
                        always_comb y_layer1_00000[0] = a2[0]; // wire
                        always_comb y_layer1_00000[1] = a2[1]; // wire
                    mux2 mux_layer1_00000(.a(y_layer1_00000), .s(s[0]), .y(y_layer2_0000[0]));
                    logic [1:0] y_layer1_00001;
                        always_comb y_layer1_00001[0] = a2[2]; // wire
                        always_comb y_layer1_00001[1] = a2[3]; // wire
                    mux2 mux_layer1_00001(.a(y_layer1_00001), .s(s[0]), .y(y_layer2_0000[1]));
                mux2 mux_layer2_0000 (.a(y_layer2_0000), .s(s[1]), .y(y_layer3_000[0]));
                logic [1:0] y_layer2_0001;
                    logic [1:0] y_layer1_00010;
                        always_comb y_layer1_00010[0] = a2[4]; // wire
                        always_comb y_layer1_00010[1] = a2[5]; // wire
                    mux2 mux_layer1_00010(.a(y_layer1_00010), .s(s[0]), .y(y_layer2_0001[0]));
                    logic [1:0] y_layer1_00011;
                        always_comb y_layer1_00011[0] = a2[6]; // wire
                        always_comb y_layer1_00011[1] = a2[7]; // wire
                    mux2 mux_layer1_00011(.a(y_layer1_00011), .s(s[0]), .y(y_layer2_0001[1]));
                mux2 mux_layer2_0001 (.a(y_layer2_0001), .s(s[1]), .y(y_layer3_000[1]));
            mux2 mux_layer3_000  (.a(y_layer3_000), .s(s[2]), .y(y_layer4_00[0]));
            logic [1:0] y_layer3_001;
                logic [1:0] y_layer2_0010;
                    logic [1:0] y_layer1_00100;
                        always_comb y_layer1_00100[0] = a2[8]; // wire
                        always_comb y_layer1_00100[1] = a2[9]; // wire
                    mux2 mux_layer1_00100(.a(y_layer1_00100), .s(s[0]), .y(y_layer2_0010[0]));
                    logic [1:0] y_layer1_00101;
                        always_comb y_layer1_00101[0] = a2[10]; // wire
                        always_comb y_layer1_00101[1] = a2[11]; // wire
                    mux2 mux_layer1_00101(.a(y_layer1_00101), .s(s[0]), .y(y_layer2_0010[1]));
                mux2 mux_layer2_0010 (.a(y_layer2_0010), .s(s[1]), .y(y_layer3_001[0]));
                logic [1:0] y_layer2_0011;
                    logic [1:0] y_layer1_00110;
                        always_comb y_layer1_00110[0] = a2[12]; // wire
                        always_comb y_layer1_00110[1] = a2[13]; // wire
                    mux2 mux_layer1_00110(.a(y_layer1_00110), .s(s[0]), .y(y_layer2_0011[0]));
                    logic [1:0] y_layer1_00111;
                        always_comb y_layer1_00111[0] = a2[14]; // wire
                        always_comb y_layer1_00111[1] = a2[15]; // wire
                    mux2 mux_layer1_00111(.a(y_layer1_00111), .s(s[0]), .y(y_layer2_0011[1]));
                mux2 mux_layer2_0011 (.a(y_layer2_0011), .s(s[1]), .y(y_layer3_001[1]));
            mux2 mux_layer3_001  (.a(y_layer3_001), .s(s[2]), .y(y_layer4_00[1]));
        mux2 mux_layer4_00   (.a(y_layer4_00), .s(s[3]), .y(y_layer5_0[0]));
        logic [1:0] y_layer4_01;
            logic [1:0] y_layer3_010;
                logic [1:0] y_layer2_0100;
                    logic [1:0] y_layer1_01000;
                        always_comb y_layer1_01000[0] = a2[16]; // wire
                        always_comb y_layer1_01000[1] = a2[17]; // wire
                    mux2 mux_layer1_01000(.a(y_layer1_01000), .s(s[0]), .y(y_layer2_0100[0]));
                    logic [1:0] y_layer1_01001;
                        always_comb y_layer1_01001[0] = a2[18]; // wire
                        always_comb y_layer1_01001[1] = a2[19]; // wire
                    mux2 mux_layer1_01001(.a(y_layer1_01001), .s(s[0]), .y(y_layer2_0100[1]));
                mux2 mux_layer2_0100 (.a(y_layer2_0100), .s(s[1]), .y(y_layer3_010[0]));
                logic [1:0] y_layer2_0101;
                    logic [1:0] y_layer1_01010;
                        always_comb y_layer1_01010[0] = a2[20]; // wire
                        always_comb y_layer1_01010[1] = a2[21]; // wire
                    mux2 mux_layer1_01010(.a(y_layer1_01010), .s(s[0]), .y(y_layer2_0101[0]));
                    logic [1:0] y_layer1_01011;
                        always_comb y_layer1_01011[0] = a2[22]; // wire
                        always_comb y_layer1_01011[1] = a2[23]; // wire
                    mux2 mux_layer1_01011(.a(y_layer1_01011), .s(s[0]), .y(y_layer2_0101[1]));
                mux2 mux_layer2_0101 (.a(y_layer2_0101), .s(s[1]), .y(y_layer3_010[1]));
            mux2 mux_layer3_010  (.a(y_layer3_010), .s(s[2]), .y(y_layer4_01[0]));
            logic [1:0] y_layer3_011;
                logic [1:0] y_layer2_0110;
                    logic [1:0] y_layer1_01100;
                        always_comb y_layer1_01100[0] = a2[24]; // wire
                        always_comb y_layer1_01100[1] = a2[25]; // wire
                    mux2 mux_layer1_01100(.a(y_layer1_01100), .s(s[0]), .y(y_layer2_0110[0]));
                    logic [1:0] y_layer1_01101;
                        always_comb y_layer1_01101[0] = a2[26]; // wire
                        always_comb y_layer1_01101[1] = a2[27]; // wire
                    mux2 mux_layer1_01101(.a(y_layer1_01101), .s(s[0]), .y(y_layer2_0110[1]));
                mux2 mux_layer2_0110 (.a(y_layer2_0110), .s(s[1]), .y(y_layer3_011[0]));
                logic [1:0] y_layer2_0111;
                    logic [1:0] y_layer1_01110;
                        always_comb y_layer1_01110[0] = a2[28]; // wire
                        always_comb y_layer1_01110[1] = a2[29]; // wire
                    mux2 mux_layer1_01110(.a(y_layer1_01110), .s(s[0]), .y(y_layer2_0111[0]));
                    logic [1:0] y_layer1_01111;
                        always_comb y_layer1_01111[0] = a2[30]; // wire
                        always_comb y_layer1_01111[1] = a2[31]; // wire
                    mux2 mux_layer1_01111(.a(y_layer1_01111), .s(s[0]), .y(y_layer2_0111[1]));
                mux2 mux_layer2_0111 (.a(y_layer2_0111), .s(s[1]), .y(y_layer3_011[1]));
            mux2 mux_layer3_011  (.a(y_layer3_011), .s(s[2]), .y(y_layer4_01[1]));
        mux2 mux_layer4_01   (.a(y_layer4_01), .s(s[3]), .y(y_layer5_0[1]));
    mux2 mux_layer5_0    (.a(y_layer5_0), .s(s[4]), .y(y));
    
endmodule
