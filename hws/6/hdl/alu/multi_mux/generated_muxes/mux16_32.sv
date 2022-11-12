`timescale 1ns/1ps
`default_nettype none
`include "./mux2.sv"

module mux16_32(a, s, y);

    input [511:0] a;
    input [3:0] s;
    output logic [31:0] y; // m-bit output of mux
    
    logic [511:0] a2; // length n2
    always_comb a2 = {{384{1'b0}}, a};

            
            ////////////////////////   INPUT WIRE 0   ////////////////////////
            
    logic [1:0] y_input_0_layer_4_0;
        logic [1:0] y_input_0_layer_3_00;
            logic [1:0] y_input_0_layer_2_000;
                logic [1:0] y_input_0_layer_1_0000;
                    always_comb y_input_0_layer_1_0000[0] = a2[0]; // wire
                    always_comb y_input_0_layer_1_0000[1] = a2[32]; // wire
                mux2 mux_input_0_layer1_0000(.a(y_input_0_layer_1_0000), .s(s[0]), .y(y_input_0_layer_2_000[0]));
                logic [1:0] y_input_0_layer_1_0001;
                    always_comb y_input_0_layer_1_0001[0] = a2[64]; // wire
                    always_comb y_input_0_layer_1_0001[1] = a2[96]; // wire
                mux2 mux_input_0_layer1_0001(.a(y_input_0_layer_1_0001), .s(s[0]), .y(y_input_0_layer_2_000[1]));
            mux2 mux_input_0_layer2_000 (.a(y_input_0_layer_2_000), .s(s[1]), .y(y_input_0_layer_3_00[0]));
            logic [1:0] y_input_0_layer_2_001;
                logic [1:0] y_input_0_layer_1_0010;
                    always_comb y_input_0_layer_1_0010[0] = a2[128]; // wire
                    always_comb y_input_0_layer_1_0010[1] = a2[160]; // wire
                mux2 mux_input_0_layer1_0010(.a(y_input_0_layer_1_0010), .s(s[0]), .y(y_input_0_layer_2_001[0]));
                logic [1:0] y_input_0_layer_1_0011;
                    always_comb y_input_0_layer_1_0011[0] = a2[192]; // wire
                    always_comb y_input_0_layer_1_0011[1] = a2[224]; // wire
                mux2 mux_input_0_layer1_0011(.a(y_input_0_layer_1_0011), .s(s[0]), .y(y_input_0_layer_2_001[1]));
            mux2 mux_input_0_layer2_001 (.a(y_input_0_layer_2_001), .s(s[1]), .y(y_input_0_layer_3_00[1]));
        mux2 mux_input_0_layer3_00  (.a(y_input_0_layer_3_00), .s(s[2]), .y(y_input_0_layer_4_0[0]));
        logic [1:0] y_input_0_layer_3_01;
            logic [1:0] y_input_0_layer_2_010;
                logic [1:0] y_input_0_layer_1_0100;
                    always_comb y_input_0_layer_1_0100[0] = a2[256]; // wire
                    always_comb y_input_0_layer_1_0100[1] = a2[288]; // wire
                mux2 mux_input_0_layer1_0100(.a(y_input_0_layer_1_0100), .s(s[0]), .y(y_input_0_layer_2_010[0]));
                logic [1:0] y_input_0_layer_1_0101;
                    always_comb y_input_0_layer_1_0101[0] = a2[320]; // wire
                    always_comb y_input_0_layer_1_0101[1] = a2[352]; // wire
                mux2 mux_input_0_layer1_0101(.a(y_input_0_layer_1_0101), .s(s[0]), .y(y_input_0_layer_2_010[1]));
            mux2 mux_input_0_layer2_010 (.a(y_input_0_layer_2_010), .s(s[1]), .y(y_input_0_layer_3_01[0]));
            logic [1:0] y_input_0_layer_2_011;
                logic [1:0] y_input_0_layer_1_0110;
                    always_comb y_input_0_layer_1_0110[0] = a2[384]; // wire
                    always_comb y_input_0_layer_1_0110[1] = a2[416]; // wire
                mux2 mux_input_0_layer1_0110(.a(y_input_0_layer_1_0110), .s(s[0]), .y(y_input_0_layer_2_011[0]));
                logic [1:0] y_input_0_layer_1_0111;
                    always_comb y_input_0_layer_1_0111[0] = a2[448]; // wire
                    always_comb y_input_0_layer_1_0111[1] = a2[480]; // wire
                mux2 mux_input_0_layer1_0111(.a(y_input_0_layer_1_0111), .s(s[0]), .y(y_input_0_layer_2_011[1]));
            mux2 mux_input_0_layer2_011 (.a(y_input_0_layer_2_011), .s(s[1]), .y(y_input_0_layer_3_01[1]));
        mux2 mux_input_0_layer3_01  (.a(y_input_0_layer_3_01), .s(s[2]), .y(y_input_0_layer_4_0[1]));
    mux2 mux_input_0_layer4_0   (.a(y_input_0_layer_4_0), .s(s[3]), .y(y[0]));
            
            ////////////////////////   INPUT WIRE 1   ////////////////////////
            
    logic [1:0] y_input_1_layer_4_0;
        logic [1:0] y_input_1_layer_3_00;
            logic [1:0] y_input_1_layer_2_000;
                logic [1:0] y_input_1_layer_1_0000;
                    always_comb y_input_1_layer_1_0000[0] = a2[1]; // wire
                    always_comb y_input_1_layer_1_0000[1] = a2[33]; // wire
                mux2 mux_input_1_layer1_0000(.a(y_input_1_layer_1_0000), .s(s[0]), .y(y_input_1_layer_2_000[0]));
                logic [1:0] y_input_1_layer_1_0001;
                    always_comb y_input_1_layer_1_0001[0] = a2[65]; // wire
                    always_comb y_input_1_layer_1_0001[1] = a2[97]; // wire
                mux2 mux_input_1_layer1_0001(.a(y_input_1_layer_1_0001), .s(s[0]), .y(y_input_1_layer_2_000[1]));
            mux2 mux_input_1_layer2_000 (.a(y_input_1_layer_2_000), .s(s[1]), .y(y_input_1_layer_3_00[0]));
            logic [1:0] y_input_1_layer_2_001;
                logic [1:0] y_input_1_layer_1_0010;
                    always_comb y_input_1_layer_1_0010[0] = a2[129]; // wire
                    always_comb y_input_1_layer_1_0010[1] = a2[161]; // wire
                mux2 mux_input_1_layer1_0010(.a(y_input_1_layer_1_0010), .s(s[0]), .y(y_input_1_layer_2_001[0]));
                logic [1:0] y_input_1_layer_1_0011;
                    always_comb y_input_1_layer_1_0011[0] = a2[193]; // wire
                    always_comb y_input_1_layer_1_0011[1] = a2[225]; // wire
                mux2 mux_input_1_layer1_0011(.a(y_input_1_layer_1_0011), .s(s[0]), .y(y_input_1_layer_2_001[1]));
            mux2 mux_input_1_layer2_001 (.a(y_input_1_layer_2_001), .s(s[1]), .y(y_input_1_layer_3_00[1]));
        mux2 mux_input_1_layer3_00  (.a(y_input_1_layer_3_00), .s(s[2]), .y(y_input_1_layer_4_0[0]));
        logic [1:0] y_input_1_layer_3_01;
            logic [1:0] y_input_1_layer_2_010;
                logic [1:0] y_input_1_layer_1_0100;
                    always_comb y_input_1_layer_1_0100[0] = a2[257]; // wire
                    always_comb y_input_1_layer_1_0100[1] = a2[289]; // wire
                mux2 mux_input_1_layer1_0100(.a(y_input_1_layer_1_0100), .s(s[0]), .y(y_input_1_layer_2_010[0]));
                logic [1:0] y_input_1_layer_1_0101;
                    always_comb y_input_1_layer_1_0101[0] = a2[321]; // wire
                    always_comb y_input_1_layer_1_0101[1] = a2[353]; // wire
                mux2 mux_input_1_layer1_0101(.a(y_input_1_layer_1_0101), .s(s[0]), .y(y_input_1_layer_2_010[1]));
            mux2 mux_input_1_layer2_010 (.a(y_input_1_layer_2_010), .s(s[1]), .y(y_input_1_layer_3_01[0]));
            logic [1:0] y_input_1_layer_2_011;
                logic [1:0] y_input_1_layer_1_0110;
                    always_comb y_input_1_layer_1_0110[0] = a2[385]; // wire
                    always_comb y_input_1_layer_1_0110[1] = a2[417]; // wire
                mux2 mux_input_1_layer1_0110(.a(y_input_1_layer_1_0110), .s(s[0]), .y(y_input_1_layer_2_011[0]));
                logic [1:0] y_input_1_layer_1_0111;
                    always_comb y_input_1_layer_1_0111[0] = a2[449]; // wire
                    always_comb y_input_1_layer_1_0111[1] = a2[481]; // wire
                mux2 mux_input_1_layer1_0111(.a(y_input_1_layer_1_0111), .s(s[0]), .y(y_input_1_layer_2_011[1]));
            mux2 mux_input_1_layer2_011 (.a(y_input_1_layer_2_011), .s(s[1]), .y(y_input_1_layer_3_01[1]));
        mux2 mux_input_1_layer3_01  (.a(y_input_1_layer_3_01), .s(s[2]), .y(y_input_1_layer_4_0[1]));
    mux2 mux_input_1_layer4_0   (.a(y_input_1_layer_4_0), .s(s[3]), .y(y[1]));
            
            ////////////////////////   INPUT WIRE 2   ////////////////////////
            
    logic [1:0] y_input_2_layer_4_0;
        logic [1:0] y_input_2_layer_3_00;
            logic [1:0] y_input_2_layer_2_000;
                logic [1:0] y_input_2_layer_1_0000;
                    always_comb y_input_2_layer_1_0000[0] = a2[2]; // wire
                    always_comb y_input_2_layer_1_0000[1] = a2[34]; // wire
                mux2 mux_input_2_layer1_0000(.a(y_input_2_layer_1_0000), .s(s[0]), .y(y_input_2_layer_2_000[0]));
                logic [1:0] y_input_2_layer_1_0001;
                    always_comb y_input_2_layer_1_0001[0] = a2[66]; // wire
                    always_comb y_input_2_layer_1_0001[1] = a2[98]; // wire
                mux2 mux_input_2_layer1_0001(.a(y_input_2_layer_1_0001), .s(s[0]), .y(y_input_2_layer_2_000[1]));
            mux2 mux_input_2_layer2_000 (.a(y_input_2_layer_2_000), .s(s[1]), .y(y_input_2_layer_3_00[0]));
            logic [1:0] y_input_2_layer_2_001;
                logic [1:0] y_input_2_layer_1_0010;
                    always_comb y_input_2_layer_1_0010[0] = a2[130]; // wire
                    always_comb y_input_2_layer_1_0010[1] = a2[162]; // wire
                mux2 mux_input_2_layer1_0010(.a(y_input_2_layer_1_0010), .s(s[0]), .y(y_input_2_layer_2_001[0]));
                logic [1:0] y_input_2_layer_1_0011;
                    always_comb y_input_2_layer_1_0011[0] = a2[194]; // wire
                    always_comb y_input_2_layer_1_0011[1] = a2[226]; // wire
                mux2 mux_input_2_layer1_0011(.a(y_input_2_layer_1_0011), .s(s[0]), .y(y_input_2_layer_2_001[1]));
            mux2 mux_input_2_layer2_001 (.a(y_input_2_layer_2_001), .s(s[1]), .y(y_input_2_layer_3_00[1]));
        mux2 mux_input_2_layer3_00  (.a(y_input_2_layer_3_00), .s(s[2]), .y(y_input_2_layer_4_0[0]));
        logic [1:0] y_input_2_layer_3_01;
            logic [1:0] y_input_2_layer_2_010;
                logic [1:0] y_input_2_layer_1_0100;
                    always_comb y_input_2_layer_1_0100[0] = a2[258]; // wire
                    always_comb y_input_2_layer_1_0100[1] = a2[290]; // wire
                mux2 mux_input_2_layer1_0100(.a(y_input_2_layer_1_0100), .s(s[0]), .y(y_input_2_layer_2_010[0]));
                logic [1:0] y_input_2_layer_1_0101;
                    always_comb y_input_2_layer_1_0101[0] = a2[322]; // wire
                    always_comb y_input_2_layer_1_0101[1] = a2[354]; // wire
                mux2 mux_input_2_layer1_0101(.a(y_input_2_layer_1_0101), .s(s[0]), .y(y_input_2_layer_2_010[1]));
            mux2 mux_input_2_layer2_010 (.a(y_input_2_layer_2_010), .s(s[1]), .y(y_input_2_layer_3_01[0]));
            logic [1:0] y_input_2_layer_2_011;
                logic [1:0] y_input_2_layer_1_0110;
                    always_comb y_input_2_layer_1_0110[0] = a2[386]; // wire
                    always_comb y_input_2_layer_1_0110[1] = a2[418]; // wire
                mux2 mux_input_2_layer1_0110(.a(y_input_2_layer_1_0110), .s(s[0]), .y(y_input_2_layer_2_011[0]));
                logic [1:0] y_input_2_layer_1_0111;
                    always_comb y_input_2_layer_1_0111[0] = a2[450]; // wire
                    always_comb y_input_2_layer_1_0111[1] = a2[482]; // wire
                mux2 mux_input_2_layer1_0111(.a(y_input_2_layer_1_0111), .s(s[0]), .y(y_input_2_layer_2_011[1]));
            mux2 mux_input_2_layer2_011 (.a(y_input_2_layer_2_011), .s(s[1]), .y(y_input_2_layer_3_01[1]));
        mux2 mux_input_2_layer3_01  (.a(y_input_2_layer_3_01), .s(s[2]), .y(y_input_2_layer_4_0[1]));
    mux2 mux_input_2_layer4_0   (.a(y_input_2_layer_4_0), .s(s[3]), .y(y[2]));
            
            ////////////////////////   INPUT WIRE 3   ////////////////////////
            
    logic [1:0] y_input_3_layer_4_0;
        logic [1:0] y_input_3_layer_3_00;
            logic [1:0] y_input_3_layer_2_000;
                logic [1:0] y_input_3_layer_1_0000;
                    always_comb y_input_3_layer_1_0000[0] = a2[3]; // wire
                    always_comb y_input_3_layer_1_0000[1] = a2[35]; // wire
                mux2 mux_input_3_layer1_0000(.a(y_input_3_layer_1_0000), .s(s[0]), .y(y_input_3_layer_2_000[0]));
                logic [1:0] y_input_3_layer_1_0001;
                    always_comb y_input_3_layer_1_0001[0] = a2[67]; // wire
                    always_comb y_input_3_layer_1_0001[1] = a2[99]; // wire
                mux2 mux_input_3_layer1_0001(.a(y_input_3_layer_1_0001), .s(s[0]), .y(y_input_3_layer_2_000[1]));
            mux2 mux_input_3_layer2_000 (.a(y_input_3_layer_2_000), .s(s[1]), .y(y_input_3_layer_3_00[0]));
            logic [1:0] y_input_3_layer_2_001;
                logic [1:0] y_input_3_layer_1_0010;
                    always_comb y_input_3_layer_1_0010[0] = a2[131]; // wire
                    always_comb y_input_3_layer_1_0010[1] = a2[163]; // wire
                mux2 mux_input_3_layer1_0010(.a(y_input_3_layer_1_0010), .s(s[0]), .y(y_input_3_layer_2_001[0]));
                logic [1:0] y_input_3_layer_1_0011;
                    always_comb y_input_3_layer_1_0011[0] = a2[195]; // wire
                    always_comb y_input_3_layer_1_0011[1] = a2[227]; // wire
                mux2 mux_input_3_layer1_0011(.a(y_input_3_layer_1_0011), .s(s[0]), .y(y_input_3_layer_2_001[1]));
            mux2 mux_input_3_layer2_001 (.a(y_input_3_layer_2_001), .s(s[1]), .y(y_input_3_layer_3_00[1]));
        mux2 mux_input_3_layer3_00  (.a(y_input_3_layer_3_00), .s(s[2]), .y(y_input_3_layer_4_0[0]));
        logic [1:0] y_input_3_layer_3_01;
            logic [1:0] y_input_3_layer_2_010;
                logic [1:0] y_input_3_layer_1_0100;
                    always_comb y_input_3_layer_1_0100[0] = a2[259]; // wire
                    always_comb y_input_3_layer_1_0100[1] = a2[291]; // wire
                mux2 mux_input_3_layer1_0100(.a(y_input_3_layer_1_0100), .s(s[0]), .y(y_input_3_layer_2_010[0]));
                logic [1:0] y_input_3_layer_1_0101;
                    always_comb y_input_3_layer_1_0101[0] = a2[323]; // wire
                    always_comb y_input_3_layer_1_0101[1] = a2[355]; // wire
                mux2 mux_input_3_layer1_0101(.a(y_input_3_layer_1_0101), .s(s[0]), .y(y_input_3_layer_2_010[1]));
            mux2 mux_input_3_layer2_010 (.a(y_input_3_layer_2_010), .s(s[1]), .y(y_input_3_layer_3_01[0]));
            logic [1:0] y_input_3_layer_2_011;
                logic [1:0] y_input_3_layer_1_0110;
                    always_comb y_input_3_layer_1_0110[0] = a2[387]; // wire
                    always_comb y_input_3_layer_1_0110[1] = a2[419]; // wire
                mux2 mux_input_3_layer1_0110(.a(y_input_3_layer_1_0110), .s(s[0]), .y(y_input_3_layer_2_011[0]));
                logic [1:0] y_input_3_layer_1_0111;
                    always_comb y_input_3_layer_1_0111[0] = a2[451]; // wire
                    always_comb y_input_3_layer_1_0111[1] = a2[483]; // wire
                mux2 mux_input_3_layer1_0111(.a(y_input_3_layer_1_0111), .s(s[0]), .y(y_input_3_layer_2_011[1]));
            mux2 mux_input_3_layer2_011 (.a(y_input_3_layer_2_011), .s(s[1]), .y(y_input_3_layer_3_01[1]));
        mux2 mux_input_3_layer3_01  (.a(y_input_3_layer_3_01), .s(s[2]), .y(y_input_3_layer_4_0[1]));
    mux2 mux_input_3_layer4_0   (.a(y_input_3_layer_4_0), .s(s[3]), .y(y[3]));
            
            ////////////////////////   INPUT WIRE 4   ////////////////////////
            
    logic [1:0] y_input_4_layer_4_0;
        logic [1:0] y_input_4_layer_3_00;
            logic [1:0] y_input_4_layer_2_000;
                logic [1:0] y_input_4_layer_1_0000;
                    always_comb y_input_4_layer_1_0000[0] = a2[4]; // wire
                    always_comb y_input_4_layer_1_0000[1] = a2[36]; // wire
                mux2 mux_input_4_layer1_0000(.a(y_input_4_layer_1_0000), .s(s[0]), .y(y_input_4_layer_2_000[0]));
                logic [1:0] y_input_4_layer_1_0001;
                    always_comb y_input_4_layer_1_0001[0] = a2[68]; // wire
                    always_comb y_input_4_layer_1_0001[1] = a2[100]; // wire
                mux2 mux_input_4_layer1_0001(.a(y_input_4_layer_1_0001), .s(s[0]), .y(y_input_4_layer_2_000[1]));
            mux2 mux_input_4_layer2_000 (.a(y_input_4_layer_2_000), .s(s[1]), .y(y_input_4_layer_3_00[0]));
            logic [1:0] y_input_4_layer_2_001;
                logic [1:0] y_input_4_layer_1_0010;
                    always_comb y_input_4_layer_1_0010[0] = a2[132]; // wire
                    always_comb y_input_4_layer_1_0010[1] = a2[164]; // wire
                mux2 mux_input_4_layer1_0010(.a(y_input_4_layer_1_0010), .s(s[0]), .y(y_input_4_layer_2_001[0]));
                logic [1:0] y_input_4_layer_1_0011;
                    always_comb y_input_4_layer_1_0011[0] = a2[196]; // wire
                    always_comb y_input_4_layer_1_0011[1] = a2[228]; // wire
                mux2 mux_input_4_layer1_0011(.a(y_input_4_layer_1_0011), .s(s[0]), .y(y_input_4_layer_2_001[1]));
            mux2 mux_input_4_layer2_001 (.a(y_input_4_layer_2_001), .s(s[1]), .y(y_input_4_layer_3_00[1]));
        mux2 mux_input_4_layer3_00  (.a(y_input_4_layer_3_00), .s(s[2]), .y(y_input_4_layer_4_0[0]));
        logic [1:0] y_input_4_layer_3_01;
            logic [1:0] y_input_4_layer_2_010;
                logic [1:0] y_input_4_layer_1_0100;
                    always_comb y_input_4_layer_1_0100[0] = a2[260]; // wire
                    always_comb y_input_4_layer_1_0100[1] = a2[292]; // wire
                mux2 mux_input_4_layer1_0100(.a(y_input_4_layer_1_0100), .s(s[0]), .y(y_input_4_layer_2_010[0]));
                logic [1:0] y_input_4_layer_1_0101;
                    always_comb y_input_4_layer_1_0101[0] = a2[324]; // wire
                    always_comb y_input_4_layer_1_0101[1] = a2[356]; // wire
                mux2 mux_input_4_layer1_0101(.a(y_input_4_layer_1_0101), .s(s[0]), .y(y_input_4_layer_2_010[1]));
            mux2 mux_input_4_layer2_010 (.a(y_input_4_layer_2_010), .s(s[1]), .y(y_input_4_layer_3_01[0]));
            logic [1:0] y_input_4_layer_2_011;
                logic [1:0] y_input_4_layer_1_0110;
                    always_comb y_input_4_layer_1_0110[0] = a2[388]; // wire
                    always_comb y_input_4_layer_1_0110[1] = a2[420]; // wire
                mux2 mux_input_4_layer1_0110(.a(y_input_4_layer_1_0110), .s(s[0]), .y(y_input_4_layer_2_011[0]));
                logic [1:0] y_input_4_layer_1_0111;
                    always_comb y_input_4_layer_1_0111[0] = a2[452]; // wire
                    always_comb y_input_4_layer_1_0111[1] = a2[484]; // wire
                mux2 mux_input_4_layer1_0111(.a(y_input_4_layer_1_0111), .s(s[0]), .y(y_input_4_layer_2_011[1]));
            mux2 mux_input_4_layer2_011 (.a(y_input_4_layer_2_011), .s(s[1]), .y(y_input_4_layer_3_01[1]));
        mux2 mux_input_4_layer3_01  (.a(y_input_4_layer_3_01), .s(s[2]), .y(y_input_4_layer_4_0[1]));
    mux2 mux_input_4_layer4_0   (.a(y_input_4_layer_4_0), .s(s[3]), .y(y[4]));
            
            ////////////////////////   INPUT WIRE 5   ////////////////////////
            
    logic [1:0] y_input_5_layer_4_0;
        logic [1:0] y_input_5_layer_3_00;
            logic [1:0] y_input_5_layer_2_000;
                logic [1:0] y_input_5_layer_1_0000;
                    always_comb y_input_5_layer_1_0000[0] = a2[5]; // wire
                    always_comb y_input_5_layer_1_0000[1] = a2[37]; // wire
                mux2 mux_input_5_layer1_0000(.a(y_input_5_layer_1_0000), .s(s[0]), .y(y_input_5_layer_2_000[0]));
                logic [1:0] y_input_5_layer_1_0001;
                    always_comb y_input_5_layer_1_0001[0] = a2[69]; // wire
                    always_comb y_input_5_layer_1_0001[1] = a2[101]; // wire
                mux2 mux_input_5_layer1_0001(.a(y_input_5_layer_1_0001), .s(s[0]), .y(y_input_5_layer_2_000[1]));
            mux2 mux_input_5_layer2_000 (.a(y_input_5_layer_2_000), .s(s[1]), .y(y_input_5_layer_3_00[0]));
            logic [1:0] y_input_5_layer_2_001;
                logic [1:0] y_input_5_layer_1_0010;
                    always_comb y_input_5_layer_1_0010[0] = a2[133]; // wire
                    always_comb y_input_5_layer_1_0010[1] = a2[165]; // wire
                mux2 mux_input_5_layer1_0010(.a(y_input_5_layer_1_0010), .s(s[0]), .y(y_input_5_layer_2_001[0]));
                logic [1:0] y_input_5_layer_1_0011;
                    always_comb y_input_5_layer_1_0011[0] = a2[197]; // wire
                    always_comb y_input_5_layer_1_0011[1] = a2[229]; // wire
                mux2 mux_input_5_layer1_0011(.a(y_input_5_layer_1_0011), .s(s[0]), .y(y_input_5_layer_2_001[1]));
            mux2 mux_input_5_layer2_001 (.a(y_input_5_layer_2_001), .s(s[1]), .y(y_input_5_layer_3_00[1]));
        mux2 mux_input_5_layer3_00  (.a(y_input_5_layer_3_00), .s(s[2]), .y(y_input_5_layer_4_0[0]));
        logic [1:0] y_input_5_layer_3_01;
            logic [1:0] y_input_5_layer_2_010;
                logic [1:0] y_input_5_layer_1_0100;
                    always_comb y_input_5_layer_1_0100[0] = a2[261]; // wire
                    always_comb y_input_5_layer_1_0100[1] = a2[293]; // wire
                mux2 mux_input_5_layer1_0100(.a(y_input_5_layer_1_0100), .s(s[0]), .y(y_input_5_layer_2_010[0]));
                logic [1:0] y_input_5_layer_1_0101;
                    always_comb y_input_5_layer_1_0101[0] = a2[325]; // wire
                    always_comb y_input_5_layer_1_0101[1] = a2[357]; // wire
                mux2 mux_input_5_layer1_0101(.a(y_input_5_layer_1_0101), .s(s[0]), .y(y_input_5_layer_2_010[1]));
            mux2 mux_input_5_layer2_010 (.a(y_input_5_layer_2_010), .s(s[1]), .y(y_input_5_layer_3_01[0]));
            logic [1:0] y_input_5_layer_2_011;
                logic [1:0] y_input_5_layer_1_0110;
                    always_comb y_input_5_layer_1_0110[0] = a2[389]; // wire
                    always_comb y_input_5_layer_1_0110[1] = a2[421]; // wire
                mux2 mux_input_5_layer1_0110(.a(y_input_5_layer_1_0110), .s(s[0]), .y(y_input_5_layer_2_011[0]));
                logic [1:0] y_input_5_layer_1_0111;
                    always_comb y_input_5_layer_1_0111[0] = a2[453]; // wire
                    always_comb y_input_5_layer_1_0111[1] = a2[485]; // wire
                mux2 mux_input_5_layer1_0111(.a(y_input_5_layer_1_0111), .s(s[0]), .y(y_input_5_layer_2_011[1]));
            mux2 mux_input_5_layer2_011 (.a(y_input_5_layer_2_011), .s(s[1]), .y(y_input_5_layer_3_01[1]));
        mux2 mux_input_5_layer3_01  (.a(y_input_5_layer_3_01), .s(s[2]), .y(y_input_5_layer_4_0[1]));
    mux2 mux_input_5_layer4_0   (.a(y_input_5_layer_4_0), .s(s[3]), .y(y[5]));
            
            ////////////////////////   INPUT WIRE 6   ////////////////////////
            
    logic [1:0] y_input_6_layer_4_0;
        logic [1:0] y_input_6_layer_3_00;
            logic [1:0] y_input_6_layer_2_000;
                logic [1:0] y_input_6_layer_1_0000;
                    always_comb y_input_6_layer_1_0000[0] = a2[6]; // wire
                    always_comb y_input_6_layer_1_0000[1] = a2[38]; // wire
                mux2 mux_input_6_layer1_0000(.a(y_input_6_layer_1_0000), .s(s[0]), .y(y_input_6_layer_2_000[0]));
                logic [1:0] y_input_6_layer_1_0001;
                    always_comb y_input_6_layer_1_0001[0] = a2[70]; // wire
                    always_comb y_input_6_layer_1_0001[1] = a2[102]; // wire
                mux2 mux_input_6_layer1_0001(.a(y_input_6_layer_1_0001), .s(s[0]), .y(y_input_6_layer_2_000[1]));
            mux2 mux_input_6_layer2_000 (.a(y_input_6_layer_2_000), .s(s[1]), .y(y_input_6_layer_3_00[0]));
            logic [1:0] y_input_6_layer_2_001;
                logic [1:0] y_input_6_layer_1_0010;
                    always_comb y_input_6_layer_1_0010[0] = a2[134]; // wire
                    always_comb y_input_6_layer_1_0010[1] = a2[166]; // wire
                mux2 mux_input_6_layer1_0010(.a(y_input_6_layer_1_0010), .s(s[0]), .y(y_input_6_layer_2_001[0]));
                logic [1:0] y_input_6_layer_1_0011;
                    always_comb y_input_6_layer_1_0011[0] = a2[198]; // wire
                    always_comb y_input_6_layer_1_0011[1] = a2[230]; // wire
                mux2 mux_input_6_layer1_0011(.a(y_input_6_layer_1_0011), .s(s[0]), .y(y_input_6_layer_2_001[1]));
            mux2 mux_input_6_layer2_001 (.a(y_input_6_layer_2_001), .s(s[1]), .y(y_input_6_layer_3_00[1]));
        mux2 mux_input_6_layer3_00  (.a(y_input_6_layer_3_00), .s(s[2]), .y(y_input_6_layer_4_0[0]));
        logic [1:0] y_input_6_layer_3_01;
            logic [1:0] y_input_6_layer_2_010;
                logic [1:0] y_input_6_layer_1_0100;
                    always_comb y_input_6_layer_1_0100[0] = a2[262]; // wire
                    always_comb y_input_6_layer_1_0100[1] = a2[294]; // wire
                mux2 mux_input_6_layer1_0100(.a(y_input_6_layer_1_0100), .s(s[0]), .y(y_input_6_layer_2_010[0]));
                logic [1:0] y_input_6_layer_1_0101;
                    always_comb y_input_6_layer_1_0101[0] = a2[326]; // wire
                    always_comb y_input_6_layer_1_0101[1] = a2[358]; // wire
                mux2 mux_input_6_layer1_0101(.a(y_input_6_layer_1_0101), .s(s[0]), .y(y_input_6_layer_2_010[1]));
            mux2 mux_input_6_layer2_010 (.a(y_input_6_layer_2_010), .s(s[1]), .y(y_input_6_layer_3_01[0]));
            logic [1:0] y_input_6_layer_2_011;
                logic [1:0] y_input_6_layer_1_0110;
                    always_comb y_input_6_layer_1_0110[0] = a2[390]; // wire
                    always_comb y_input_6_layer_1_0110[1] = a2[422]; // wire
                mux2 mux_input_6_layer1_0110(.a(y_input_6_layer_1_0110), .s(s[0]), .y(y_input_6_layer_2_011[0]));
                logic [1:0] y_input_6_layer_1_0111;
                    always_comb y_input_6_layer_1_0111[0] = a2[454]; // wire
                    always_comb y_input_6_layer_1_0111[1] = a2[486]; // wire
                mux2 mux_input_6_layer1_0111(.a(y_input_6_layer_1_0111), .s(s[0]), .y(y_input_6_layer_2_011[1]));
            mux2 mux_input_6_layer2_011 (.a(y_input_6_layer_2_011), .s(s[1]), .y(y_input_6_layer_3_01[1]));
        mux2 mux_input_6_layer3_01  (.a(y_input_6_layer_3_01), .s(s[2]), .y(y_input_6_layer_4_0[1]));
    mux2 mux_input_6_layer4_0   (.a(y_input_6_layer_4_0), .s(s[3]), .y(y[6]));
            
            ////////////////////////   INPUT WIRE 7   ////////////////////////
            
    logic [1:0] y_input_7_layer_4_0;
        logic [1:0] y_input_7_layer_3_00;
            logic [1:0] y_input_7_layer_2_000;
                logic [1:0] y_input_7_layer_1_0000;
                    always_comb y_input_7_layer_1_0000[0] = a2[7]; // wire
                    always_comb y_input_7_layer_1_0000[1] = a2[39]; // wire
                mux2 mux_input_7_layer1_0000(.a(y_input_7_layer_1_0000), .s(s[0]), .y(y_input_7_layer_2_000[0]));
                logic [1:0] y_input_7_layer_1_0001;
                    always_comb y_input_7_layer_1_0001[0] = a2[71]; // wire
                    always_comb y_input_7_layer_1_0001[1] = a2[103]; // wire
                mux2 mux_input_7_layer1_0001(.a(y_input_7_layer_1_0001), .s(s[0]), .y(y_input_7_layer_2_000[1]));
            mux2 mux_input_7_layer2_000 (.a(y_input_7_layer_2_000), .s(s[1]), .y(y_input_7_layer_3_00[0]));
            logic [1:0] y_input_7_layer_2_001;
                logic [1:0] y_input_7_layer_1_0010;
                    always_comb y_input_7_layer_1_0010[0] = a2[135]; // wire
                    always_comb y_input_7_layer_1_0010[1] = a2[167]; // wire
                mux2 mux_input_7_layer1_0010(.a(y_input_7_layer_1_0010), .s(s[0]), .y(y_input_7_layer_2_001[0]));
                logic [1:0] y_input_7_layer_1_0011;
                    always_comb y_input_7_layer_1_0011[0] = a2[199]; // wire
                    always_comb y_input_7_layer_1_0011[1] = a2[231]; // wire
                mux2 mux_input_7_layer1_0011(.a(y_input_7_layer_1_0011), .s(s[0]), .y(y_input_7_layer_2_001[1]));
            mux2 mux_input_7_layer2_001 (.a(y_input_7_layer_2_001), .s(s[1]), .y(y_input_7_layer_3_00[1]));
        mux2 mux_input_7_layer3_00  (.a(y_input_7_layer_3_00), .s(s[2]), .y(y_input_7_layer_4_0[0]));
        logic [1:0] y_input_7_layer_3_01;
            logic [1:0] y_input_7_layer_2_010;
                logic [1:0] y_input_7_layer_1_0100;
                    always_comb y_input_7_layer_1_0100[0] = a2[263]; // wire
                    always_comb y_input_7_layer_1_0100[1] = a2[295]; // wire
                mux2 mux_input_7_layer1_0100(.a(y_input_7_layer_1_0100), .s(s[0]), .y(y_input_7_layer_2_010[0]));
                logic [1:0] y_input_7_layer_1_0101;
                    always_comb y_input_7_layer_1_0101[0] = a2[327]; // wire
                    always_comb y_input_7_layer_1_0101[1] = a2[359]; // wire
                mux2 mux_input_7_layer1_0101(.a(y_input_7_layer_1_0101), .s(s[0]), .y(y_input_7_layer_2_010[1]));
            mux2 mux_input_7_layer2_010 (.a(y_input_7_layer_2_010), .s(s[1]), .y(y_input_7_layer_3_01[0]));
            logic [1:0] y_input_7_layer_2_011;
                logic [1:0] y_input_7_layer_1_0110;
                    always_comb y_input_7_layer_1_0110[0] = a2[391]; // wire
                    always_comb y_input_7_layer_1_0110[1] = a2[423]; // wire
                mux2 mux_input_7_layer1_0110(.a(y_input_7_layer_1_0110), .s(s[0]), .y(y_input_7_layer_2_011[0]));
                logic [1:0] y_input_7_layer_1_0111;
                    always_comb y_input_7_layer_1_0111[0] = a2[455]; // wire
                    always_comb y_input_7_layer_1_0111[1] = a2[487]; // wire
                mux2 mux_input_7_layer1_0111(.a(y_input_7_layer_1_0111), .s(s[0]), .y(y_input_7_layer_2_011[1]));
            mux2 mux_input_7_layer2_011 (.a(y_input_7_layer_2_011), .s(s[1]), .y(y_input_7_layer_3_01[1]));
        mux2 mux_input_7_layer3_01  (.a(y_input_7_layer_3_01), .s(s[2]), .y(y_input_7_layer_4_0[1]));
    mux2 mux_input_7_layer4_0   (.a(y_input_7_layer_4_0), .s(s[3]), .y(y[7]));
            
            ////////////////////////   INPUT WIRE 8   ////////////////////////
            
    logic [1:0] y_input_8_layer_4_0;
        logic [1:0] y_input_8_layer_3_00;
            logic [1:0] y_input_8_layer_2_000;
                logic [1:0] y_input_8_layer_1_0000;
                    always_comb y_input_8_layer_1_0000[0] = a2[8]; // wire
                    always_comb y_input_8_layer_1_0000[1] = a2[40]; // wire
                mux2 mux_input_8_layer1_0000(.a(y_input_8_layer_1_0000), .s(s[0]), .y(y_input_8_layer_2_000[0]));
                logic [1:0] y_input_8_layer_1_0001;
                    always_comb y_input_8_layer_1_0001[0] = a2[72]; // wire
                    always_comb y_input_8_layer_1_0001[1] = a2[104]; // wire
                mux2 mux_input_8_layer1_0001(.a(y_input_8_layer_1_0001), .s(s[0]), .y(y_input_8_layer_2_000[1]));
            mux2 mux_input_8_layer2_000 (.a(y_input_8_layer_2_000), .s(s[1]), .y(y_input_8_layer_3_00[0]));
            logic [1:0] y_input_8_layer_2_001;
                logic [1:0] y_input_8_layer_1_0010;
                    always_comb y_input_8_layer_1_0010[0] = a2[136]; // wire
                    always_comb y_input_8_layer_1_0010[1] = a2[168]; // wire
                mux2 mux_input_8_layer1_0010(.a(y_input_8_layer_1_0010), .s(s[0]), .y(y_input_8_layer_2_001[0]));
                logic [1:0] y_input_8_layer_1_0011;
                    always_comb y_input_8_layer_1_0011[0] = a2[200]; // wire
                    always_comb y_input_8_layer_1_0011[1] = a2[232]; // wire
                mux2 mux_input_8_layer1_0011(.a(y_input_8_layer_1_0011), .s(s[0]), .y(y_input_8_layer_2_001[1]));
            mux2 mux_input_8_layer2_001 (.a(y_input_8_layer_2_001), .s(s[1]), .y(y_input_8_layer_3_00[1]));
        mux2 mux_input_8_layer3_00  (.a(y_input_8_layer_3_00), .s(s[2]), .y(y_input_8_layer_4_0[0]));
        logic [1:0] y_input_8_layer_3_01;
            logic [1:0] y_input_8_layer_2_010;
                logic [1:0] y_input_8_layer_1_0100;
                    always_comb y_input_8_layer_1_0100[0] = a2[264]; // wire
                    always_comb y_input_8_layer_1_0100[1] = a2[296]; // wire
                mux2 mux_input_8_layer1_0100(.a(y_input_8_layer_1_0100), .s(s[0]), .y(y_input_8_layer_2_010[0]));
                logic [1:0] y_input_8_layer_1_0101;
                    always_comb y_input_8_layer_1_0101[0] = a2[328]; // wire
                    always_comb y_input_8_layer_1_0101[1] = a2[360]; // wire
                mux2 mux_input_8_layer1_0101(.a(y_input_8_layer_1_0101), .s(s[0]), .y(y_input_8_layer_2_010[1]));
            mux2 mux_input_8_layer2_010 (.a(y_input_8_layer_2_010), .s(s[1]), .y(y_input_8_layer_3_01[0]));
            logic [1:0] y_input_8_layer_2_011;
                logic [1:0] y_input_8_layer_1_0110;
                    always_comb y_input_8_layer_1_0110[0] = a2[392]; // wire
                    always_comb y_input_8_layer_1_0110[1] = a2[424]; // wire
                mux2 mux_input_8_layer1_0110(.a(y_input_8_layer_1_0110), .s(s[0]), .y(y_input_8_layer_2_011[0]));
                logic [1:0] y_input_8_layer_1_0111;
                    always_comb y_input_8_layer_1_0111[0] = a2[456]; // wire
                    always_comb y_input_8_layer_1_0111[1] = a2[488]; // wire
                mux2 mux_input_8_layer1_0111(.a(y_input_8_layer_1_0111), .s(s[0]), .y(y_input_8_layer_2_011[1]));
            mux2 mux_input_8_layer2_011 (.a(y_input_8_layer_2_011), .s(s[1]), .y(y_input_8_layer_3_01[1]));
        mux2 mux_input_8_layer3_01  (.a(y_input_8_layer_3_01), .s(s[2]), .y(y_input_8_layer_4_0[1]));
    mux2 mux_input_8_layer4_0   (.a(y_input_8_layer_4_0), .s(s[3]), .y(y[8]));
            
            ////////////////////////   INPUT WIRE 9   ////////////////////////
            
    logic [1:0] y_input_9_layer_4_0;
        logic [1:0] y_input_9_layer_3_00;
            logic [1:0] y_input_9_layer_2_000;
                logic [1:0] y_input_9_layer_1_0000;
                    always_comb y_input_9_layer_1_0000[0] = a2[9]; // wire
                    always_comb y_input_9_layer_1_0000[1] = a2[41]; // wire
                mux2 mux_input_9_layer1_0000(.a(y_input_9_layer_1_0000), .s(s[0]), .y(y_input_9_layer_2_000[0]));
                logic [1:0] y_input_9_layer_1_0001;
                    always_comb y_input_9_layer_1_0001[0] = a2[73]; // wire
                    always_comb y_input_9_layer_1_0001[1] = a2[105]; // wire
                mux2 mux_input_9_layer1_0001(.a(y_input_9_layer_1_0001), .s(s[0]), .y(y_input_9_layer_2_000[1]));
            mux2 mux_input_9_layer2_000 (.a(y_input_9_layer_2_000), .s(s[1]), .y(y_input_9_layer_3_00[0]));
            logic [1:0] y_input_9_layer_2_001;
                logic [1:0] y_input_9_layer_1_0010;
                    always_comb y_input_9_layer_1_0010[0] = a2[137]; // wire
                    always_comb y_input_9_layer_1_0010[1] = a2[169]; // wire
                mux2 mux_input_9_layer1_0010(.a(y_input_9_layer_1_0010), .s(s[0]), .y(y_input_9_layer_2_001[0]));
                logic [1:0] y_input_9_layer_1_0011;
                    always_comb y_input_9_layer_1_0011[0] = a2[201]; // wire
                    always_comb y_input_9_layer_1_0011[1] = a2[233]; // wire
                mux2 mux_input_9_layer1_0011(.a(y_input_9_layer_1_0011), .s(s[0]), .y(y_input_9_layer_2_001[1]));
            mux2 mux_input_9_layer2_001 (.a(y_input_9_layer_2_001), .s(s[1]), .y(y_input_9_layer_3_00[1]));
        mux2 mux_input_9_layer3_00  (.a(y_input_9_layer_3_00), .s(s[2]), .y(y_input_9_layer_4_0[0]));
        logic [1:0] y_input_9_layer_3_01;
            logic [1:0] y_input_9_layer_2_010;
                logic [1:0] y_input_9_layer_1_0100;
                    always_comb y_input_9_layer_1_0100[0] = a2[265]; // wire
                    always_comb y_input_9_layer_1_0100[1] = a2[297]; // wire
                mux2 mux_input_9_layer1_0100(.a(y_input_9_layer_1_0100), .s(s[0]), .y(y_input_9_layer_2_010[0]));
                logic [1:0] y_input_9_layer_1_0101;
                    always_comb y_input_9_layer_1_0101[0] = a2[329]; // wire
                    always_comb y_input_9_layer_1_0101[1] = a2[361]; // wire
                mux2 mux_input_9_layer1_0101(.a(y_input_9_layer_1_0101), .s(s[0]), .y(y_input_9_layer_2_010[1]));
            mux2 mux_input_9_layer2_010 (.a(y_input_9_layer_2_010), .s(s[1]), .y(y_input_9_layer_3_01[0]));
            logic [1:0] y_input_9_layer_2_011;
                logic [1:0] y_input_9_layer_1_0110;
                    always_comb y_input_9_layer_1_0110[0] = a2[393]; // wire
                    always_comb y_input_9_layer_1_0110[1] = a2[425]; // wire
                mux2 mux_input_9_layer1_0110(.a(y_input_9_layer_1_0110), .s(s[0]), .y(y_input_9_layer_2_011[0]));
                logic [1:0] y_input_9_layer_1_0111;
                    always_comb y_input_9_layer_1_0111[0] = a2[457]; // wire
                    always_comb y_input_9_layer_1_0111[1] = a2[489]; // wire
                mux2 mux_input_9_layer1_0111(.a(y_input_9_layer_1_0111), .s(s[0]), .y(y_input_9_layer_2_011[1]));
            mux2 mux_input_9_layer2_011 (.a(y_input_9_layer_2_011), .s(s[1]), .y(y_input_9_layer_3_01[1]));
        mux2 mux_input_9_layer3_01  (.a(y_input_9_layer_3_01), .s(s[2]), .y(y_input_9_layer_4_0[1]));
    mux2 mux_input_9_layer4_0   (.a(y_input_9_layer_4_0), .s(s[3]), .y(y[9]));
            
            ////////////////////////   INPUT WIRE 10   ////////////////////////
            
    logic [1:0] y_input_10_layer_4_0;
        logic [1:0] y_input_10_layer_3_00;
            logic [1:0] y_input_10_layer_2_000;
                logic [1:0] y_input_10_layer_1_0000;
                    always_comb y_input_10_layer_1_0000[0] = a2[10]; // wire
                    always_comb y_input_10_layer_1_0000[1] = a2[42]; // wire
                mux2 mux_input_10_layer1_0000(.a(y_input_10_layer_1_0000), .s(s[0]), .y(y_input_10_layer_2_000[0]));
                logic [1:0] y_input_10_layer_1_0001;
                    always_comb y_input_10_layer_1_0001[0] = a2[74]; // wire
                    always_comb y_input_10_layer_1_0001[1] = a2[106]; // wire
                mux2 mux_input_10_layer1_0001(.a(y_input_10_layer_1_0001), .s(s[0]), .y(y_input_10_layer_2_000[1]));
            mux2 mux_input_10_layer2_000 (.a(y_input_10_layer_2_000), .s(s[1]), .y(y_input_10_layer_3_00[0]));
            logic [1:0] y_input_10_layer_2_001;
                logic [1:0] y_input_10_layer_1_0010;
                    always_comb y_input_10_layer_1_0010[0] = a2[138]; // wire
                    always_comb y_input_10_layer_1_0010[1] = a2[170]; // wire
                mux2 mux_input_10_layer1_0010(.a(y_input_10_layer_1_0010), .s(s[0]), .y(y_input_10_layer_2_001[0]));
                logic [1:0] y_input_10_layer_1_0011;
                    always_comb y_input_10_layer_1_0011[0] = a2[202]; // wire
                    always_comb y_input_10_layer_1_0011[1] = a2[234]; // wire
                mux2 mux_input_10_layer1_0011(.a(y_input_10_layer_1_0011), .s(s[0]), .y(y_input_10_layer_2_001[1]));
            mux2 mux_input_10_layer2_001 (.a(y_input_10_layer_2_001), .s(s[1]), .y(y_input_10_layer_3_00[1]));
        mux2 mux_input_10_layer3_00  (.a(y_input_10_layer_3_00), .s(s[2]), .y(y_input_10_layer_4_0[0]));
        logic [1:0] y_input_10_layer_3_01;
            logic [1:0] y_input_10_layer_2_010;
                logic [1:0] y_input_10_layer_1_0100;
                    always_comb y_input_10_layer_1_0100[0] = a2[266]; // wire
                    always_comb y_input_10_layer_1_0100[1] = a2[298]; // wire
                mux2 mux_input_10_layer1_0100(.a(y_input_10_layer_1_0100), .s(s[0]), .y(y_input_10_layer_2_010[0]));
                logic [1:0] y_input_10_layer_1_0101;
                    always_comb y_input_10_layer_1_0101[0] = a2[330]; // wire
                    always_comb y_input_10_layer_1_0101[1] = a2[362]; // wire
                mux2 mux_input_10_layer1_0101(.a(y_input_10_layer_1_0101), .s(s[0]), .y(y_input_10_layer_2_010[1]));
            mux2 mux_input_10_layer2_010 (.a(y_input_10_layer_2_010), .s(s[1]), .y(y_input_10_layer_3_01[0]));
            logic [1:0] y_input_10_layer_2_011;
                logic [1:0] y_input_10_layer_1_0110;
                    always_comb y_input_10_layer_1_0110[0] = a2[394]; // wire
                    always_comb y_input_10_layer_1_0110[1] = a2[426]; // wire
                mux2 mux_input_10_layer1_0110(.a(y_input_10_layer_1_0110), .s(s[0]), .y(y_input_10_layer_2_011[0]));
                logic [1:0] y_input_10_layer_1_0111;
                    always_comb y_input_10_layer_1_0111[0] = a2[458]; // wire
                    always_comb y_input_10_layer_1_0111[1] = a2[490]; // wire
                mux2 mux_input_10_layer1_0111(.a(y_input_10_layer_1_0111), .s(s[0]), .y(y_input_10_layer_2_011[1]));
            mux2 mux_input_10_layer2_011 (.a(y_input_10_layer_2_011), .s(s[1]), .y(y_input_10_layer_3_01[1]));
        mux2 mux_input_10_layer3_01  (.a(y_input_10_layer_3_01), .s(s[2]), .y(y_input_10_layer_4_0[1]));
    mux2 mux_input_10_layer4_0   (.a(y_input_10_layer_4_0), .s(s[3]), .y(y[10]));
            
            ////////////////////////   INPUT WIRE 11   ////////////////////////
            
    logic [1:0] y_input_11_layer_4_0;
        logic [1:0] y_input_11_layer_3_00;
            logic [1:0] y_input_11_layer_2_000;
                logic [1:0] y_input_11_layer_1_0000;
                    always_comb y_input_11_layer_1_0000[0] = a2[11]; // wire
                    always_comb y_input_11_layer_1_0000[1] = a2[43]; // wire
                mux2 mux_input_11_layer1_0000(.a(y_input_11_layer_1_0000), .s(s[0]), .y(y_input_11_layer_2_000[0]));
                logic [1:0] y_input_11_layer_1_0001;
                    always_comb y_input_11_layer_1_0001[0] = a2[75]; // wire
                    always_comb y_input_11_layer_1_0001[1] = a2[107]; // wire
                mux2 mux_input_11_layer1_0001(.a(y_input_11_layer_1_0001), .s(s[0]), .y(y_input_11_layer_2_000[1]));
            mux2 mux_input_11_layer2_000 (.a(y_input_11_layer_2_000), .s(s[1]), .y(y_input_11_layer_3_00[0]));
            logic [1:0] y_input_11_layer_2_001;
                logic [1:0] y_input_11_layer_1_0010;
                    always_comb y_input_11_layer_1_0010[0] = a2[139]; // wire
                    always_comb y_input_11_layer_1_0010[1] = a2[171]; // wire
                mux2 mux_input_11_layer1_0010(.a(y_input_11_layer_1_0010), .s(s[0]), .y(y_input_11_layer_2_001[0]));
                logic [1:0] y_input_11_layer_1_0011;
                    always_comb y_input_11_layer_1_0011[0] = a2[203]; // wire
                    always_comb y_input_11_layer_1_0011[1] = a2[235]; // wire
                mux2 mux_input_11_layer1_0011(.a(y_input_11_layer_1_0011), .s(s[0]), .y(y_input_11_layer_2_001[1]));
            mux2 mux_input_11_layer2_001 (.a(y_input_11_layer_2_001), .s(s[1]), .y(y_input_11_layer_3_00[1]));
        mux2 mux_input_11_layer3_00  (.a(y_input_11_layer_3_00), .s(s[2]), .y(y_input_11_layer_4_0[0]));
        logic [1:0] y_input_11_layer_3_01;
            logic [1:0] y_input_11_layer_2_010;
                logic [1:0] y_input_11_layer_1_0100;
                    always_comb y_input_11_layer_1_0100[0] = a2[267]; // wire
                    always_comb y_input_11_layer_1_0100[1] = a2[299]; // wire
                mux2 mux_input_11_layer1_0100(.a(y_input_11_layer_1_0100), .s(s[0]), .y(y_input_11_layer_2_010[0]));
                logic [1:0] y_input_11_layer_1_0101;
                    always_comb y_input_11_layer_1_0101[0] = a2[331]; // wire
                    always_comb y_input_11_layer_1_0101[1] = a2[363]; // wire
                mux2 mux_input_11_layer1_0101(.a(y_input_11_layer_1_0101), .s(s[0]), .y(y_input_11_layer_2_010[1]));
            mux2 mux_input_11_layer2_010 (.a(y_input_11_layer_2_010), .s(s[1]), .y(y_input_11_layer_3_01[0]));
            logic [1:0] y_input_11_layer_2_011;
                logic [1:0] y_input_11_layer_1_0110;
                    always_comb y_input_11_layer_1_0110[0] = a2[395]; // wire
                    always_comb y_input_11_layer_1_0110[1] = a2[427]; // wire
                mux2 mux_input_11_layer1_0110(.a(y_input_11_layer_1_0110), .s(s[0]), .y(y_input_11_layer_2_011[0]));
                logic [1:0] y_input_11_layer_1_0111;
                    always_comb y_input_11_layer_1_0111[0] = a2[459]; // wire
                    always_comb y_input_11_layer_1_0111[1] = a2[491]; // wire
                mux2 mux_input_11_layer1_0111(.a(y_input_11_layer_1_0111), .s(s[0]), .y(y_input_11_layer_2_011[1]));
            mux2 mux_input_11_layer2_011 (.a(y_input_11_layer_2_011), .s(s[1]), .y(y_input_11_layer_3_01[1]));
        mux2 mux_input_11_layer3_01  (.a(y_input_11_layer_3_01), .s(s[2]), .y(y_input_11_layer_4_0[1]));
    mux2 mux_input_11_layer4_0   (.a(y_input_11_layer_4_0), .s(s[3]), .y(y[11]));
            
            ////////////////////////   INPUT WIRE 12   ////////////////////////
            
    logic [1:0] y_input_12_layer_4_0;
        logic [1:0] y_input_12_layer_3_00;
            logic [1:0] y_input_12_layer_2_000;
                logic [1:0] y_input_12_layer_1_0000;
                    always_comb y_input_12_layer_1_0000[0] = a2[12]; // wire
                    always_comb y_input_12_layer_1_0000[1] = a2[44]; // wire
                mux2 mux_input_12_layer1_0000(.a(y_input_12_layer_1_0000), .s(s[0]), .y(y_input_12_layer_2_000[0]));
                logic [1:0] y_input_12_layer_1_0001;
                    always_comb y_input_12_layer_1_0001[0] = a2[76]; // wire
                    always_comb y_input_12_layer_1_0001[1] = a2[108]; // wire
                mux2 mux_input_12_layer1_0001(.a(y_input_12_layer_1_0001), .s(s[0]), .y(y_input_12_layer_2_000[1]));
            mux2 mux_input_12_layer2_000 (.a(y_input_12_layer_2_000), .s(s[1]), .y(y_input_12_layer_3_00[0]));
            logic [1:0] y_input_12_layer_2_001;
                logic [1:0] y_input_12_layer_1_0010;
                    always_comb y_input_12_layer_1_0010[0] = a2[140]; // wire
                    always_comb y_input_12_layer_1_0010[1] = a2[172]; // wire
                mux2 mux_input_12_layer1_0010(.a(y_input_12_layer_1_0010), .s(s[0]), .y(y_input_12_layer_2_001[0]));
                logic [1:0] y_input_12_layer_1_0011;
                    always_comb y_input_12_layer_1_0011[0] = a2[204]; // wire
                    always_comb y_input_12_layer_1_0011[1] = a2[236]; // wire
                mux2 mux_input_12_layer1_0011(.a(y_input_12_layer_1_0011), .s(s[0]), .y(y_input_12_layer_2_001[1]));
            mux2 mux_input_12_layer2_001 (.a(y_input_12_layer_2_001), .s(s[1]), .y(y_input_12_layer_3_00[1]));
        mux2 mux_input_12_layer3_00  (.a(y_input_12_layer_3_00), .s(s[2]), .y(y_input_12_layer_4_0[0]));
        logic [1:0] y_input_12_layer_3_01;
            logic [1:0] y_input_12_layer_2_010;
                logic [1:0] y_input_12_layer_1_0100;
                    always_comb y_input_12_layer_1_0100[0] = a2[268]; // wire
                    always_comb y_input_12_layer_1_0100[1] = a2[300]; // wire
                mux2 mux_input_12_layer1_0100(.a(y_input_12_layer_1_0100), .s(s[0]), .y(y_input_12_layer_2_010[0]));
                logic [1:0] y_input_12_layer_1_0101;
                    always_comb y_input_12_layer_1_0101[0] = a2[332]; // wire
                    always_comb y_input_12_layer_1_0101[1] = a2[364]; // wire
                mux2 mux_input_12_layer1_0101(.a(y_input_12_layer_1_0101), .s(s[0]), .y(y_input_12_layer_2_010[1]));
            mux2 mux_input_12_layer2_010 (.a(y_input_12_layer_2_010), .s(s[1]), .y(y_input_12_layer_3_01[0]));
            logic [1:0] y_input_12_layer_2_011;
                logic [1:0] y_input_12_layer_1_0110;
                    always_comb y_input_12_layer_1_0110[0] = a2[396]; // wire
                    always_comb y_input_12_layer_1_0110[1] = a2[428]; // wire
                mux2 mux_input_12_layer1_0110(.a(y_input_12_layer_1_0110), .s(s[0]), .y(y_input_12_layer_2_011[0]));
                logic [1:0] y_input_12_layer_1_0111;
                    always_comb y_input_12_layer_1_0111[0] = a2[460]; // wire
                    always_comb y_input_12_layer_1_0111[1] = a2[492]; // wire
                mux2 mux_input_12_layer1_0111(.a(y_input_12_layer_1_0111), .s(s[0]), .y(y_input_12_layer_2_011[1]));
            mux2 mux_input_12_layer2_011 (.a(y_input_12_layer_2_011), .s(s[1]), .y(y_input_12_layer_3_01[1]));
        mux2 mux_input_12_layer3_01  (.a(y_input_12_layer_3_01), .s(s[2]), .y(y_input_12_layer_4_0[1]));
    mux2 mux_input_12_layer4_0   (.a(y_input_12_layer_4_0), .s(s[3]), .y(y[12]));
            
            ////////////////////////   INPUT WIRE 13   ////////////////////////
            
    logic [1:0] y_input_13_layer_4_0;
        logic [1:0] y_input_13_layer_3_00;
            logic [1:0] y_input_13_layer_2_000;
                logic [1:0] y_input_13_layer_1_0000;
                    always_comb y_input_13_layer_1_0000[0] = a2[13]; // wire
                    always_comb y_input_13_layer_1_0000[1] = a2[45]; // wire
                mux2 mux_input_13_layer1_0000(.a(y_input_13_layer_1_0000), .s(s[0]), .y(y_input_13_layer_2_000[0]));
                logic [1:0] y_input_13_layer_1_0001;
                    always_comb y_input_13_layer_1_0001[0] = a2[77]; // wire
                    always_comb y_input_13_layer_1_0001[1] = a2[109]; // wire
                mux2 mux_input_13_layer1_0001(.a(y_input_13_layer_1_0001), .s(s[0]), .y(y_input_13_layer_2_000[1]));
            mux2 mux_input_13_layer2_000 (.a(y_input_13_layer_2_000), .s(s[1]), .y(y_input_13_layer_3_00[0]));
            logic [1:0] y_input_13_layer_2_001;
                logic [1:0] y_input_13_layer_1_0010;
                    always_comb y_input_13_layer_1_0010[0] = a2[141]; // wire
                    always_comb y_input_13_layer_1_0010[1] = a2[173]; // wire
                mux2 mux_input_13_layer1_0010(.a(y_input_13_layer_1_0010), .s(s[0]), .y(y_input_13_layer_2_001[0]));
                logic [1:0] y_input_13_layer_1_0011;
                    always_comb y_input_13_layer_1_0011[0] = a2[205]; // wire
                    always_comb y_input_13_layer_1_0011[1] = a2[237]; // wire
                mux2 mux_input_13_layer1_0011(.a(y_input_13_layer_1_0011), .s(s[0]), .y(y_input_13_layer_2_001[1]));
            mux2 mux_input_13_layer2_001 (.a(y_input_13_layer_2_001), .s(s[1]), .y(y_input_13_layer_3_00[1]));
        mux2 mux_input_13_layer3_00  (.a(y_input_13_layer_3_00), .s(s[2]), .y(y_input_13_layer_4_0[0]));
        logic [1:0] y_input_13_layer_3_01;
            logic [1:0] y_input_13_layer_2_010;
                logic [1:0] y_input_13_layer_1_0100;
                    always_comb y_input_13_layer_1_0100[0] = a2[269]; // wire
                    always_comb y_input_13_layer_1_0100[1] = a2[301]; // wire
                mux2 mux_input_13_layer1_0100(.a(y_input_13_layer_1_0100), .s(s[0]), .y(y_input_13_layer_2_010[0]));
                logic [1:0] y_input_13_layer_1_0101;
                    always_comb y_input_13_layer_1_0101[0] = a2[333]; // wire
                    always_comb y_input_13_layer_1_0101[1] = a2[365]; // wire
                mux2 mux_input_13_layer1_0101(.a(y_input_13_layer_1_0101), .s(s[0]), .y(y_input_13_layer_2_010[1]));
            mux2 mux_input_13_layer2_010 (.a(y_input_13_layer_2_010), .s(s[1]), .y(y_input_13_layer_3_01[0]));
            logic [1:0] y_input_13_layer_2_011;
                logic [1:0] y_input_13_layer_1_0110;
                    always_comb y_input_13_layer_1_0110[0] = a2[397]; // wire
                    always_comb y_input_13_layer_1_0110[1] = a2[429]; // wire
                mux2 mux_input_13_layer1_0110(.a(y_input_13_layer_1_0110), .s(s[0]), .y(y_input_13_layer_2_011[0]));
                logic [1:0] y_input_13_layer_1_0111;
                    always_comb y_input_13_layer_1_0111[0] = a2[461]; // wire
                    always_comb y_input_13_layer_1_0111[1] = a2[493]; // wire
                mux2 mux_input_13_layer1_0111(.a(y_input_13_layer_1_0111), .s(s[0]), .y(y_input_13_layer_2_011[1]));
            mux2 mux_input_13_layer2_011 (.a(y_input_13_layer_2_011), .s(s[1]), .y(y_input_13_layer_3_01[1]));
        mux2 mux_input_13_layer3_01  (.a(y_input_13_layer_3_01), .s(s[2]), .y(y_input_13_layer_4_0[1]));
    mux2 mux_input_13_layer4_0   (.a(y_input_13_layer_4_0), .s(s[3]), .y(y[13]));
            
            ////////////////////////   INPUT WIRE 14   ////////////////////////
            
    logic [1:0] y_input_14_layer_4_0;
        logic [1:0] y_input_14_layer_3_00;
            logic [1:0] y_input_14_layer_2_000;
                logic [1:0] y_input_14_layer_1_0000;
                    always_comb y_input_14_layer_1_0000[0] = a2[14]; // wire
                    always_comb y_input_14_layer_1_0000[1] = a2[46]; // wire
                mux2 mux_input_14_layer1_0000(.a(y_input_14_layer_1_0000), .s(s[0]), .y(y_input_14_layer_2_000[0]));
                logic [1:0] y_input_14_layer_1_0001;
                    always_comb y_input_14_layer_1_0001[0] = a2[78]; // wire
                    always_comb y_input_14_layer_1_0001[1] = a2[110]; // wire
                mux2 mux_input_14_layer1_0001(.a(y_input_14_layer_1_0001), .s(s[0]), .y(y_input_14_layer_2_000[1]));
            mux2 mux_input_14_layer2_000 (.a(y_input_14_layer_2_000), .s(s[1]), .y(y_input_14_layer_3_00[0]));
            logic [1:0] y_input_14_layer_2_001;
                logic [1:0] y_input_14_layer_1_0010;
                    always_comb y_input_14_layer_1_0010[0] = a2[142]; // wire
                    always_comb y_input_14_layer_1_0010[1] = a2[174]; // wire
                mux2 mux_input_14_layer1_0010(.a(y_input_14_layer_1_0010), .s(s[0]), .y(y_input_14_layer_2_001[0]));
                logic [1:0] y_input_14_layer_1_0011;
                    always_comb y_input_14_layer_1_0011[0] = a2[206]; // wire
                    always_comb y_input_14_layer_1_0011[1] = a2[238]; // wire
                mux2 mux_input_14_layer1_0011(.a(y_input_14_layer_1_0011), .s(s[0]), .y(y_input_14_layer_2_001[1]));
            mux2 mux_input_14_layer2_001 (.a(y_input_14_layer_2_001), .s(s[1]), .y(y_input_14_layer_3_00[1]));
        mux2 mux_input_14_layer3_00  (.a(y_input_14_layer_3_00), .s(s[2]), .y(y_input_14_layer_4_0[0]));
        logic [1:0] y_input_14_layer_3_01;
            logic [1:0] y_input_14_layer_2_010;
                logic [1:0] y_input_14_layer_1_0100;
                    always_comb y_input_14_layer_1_0100[0] = a2[270]; // wire
                    always_comb y_input_14_layer_1_0100[1] = a2[302]; // wire
                mux2 mux_input_14_layer1_0100(.a(y_input_14_layer_1_0100), .s(s[0]), .y(y_input_14_layer_2_010[0]));
                logic [1:0] y_input_14_layer_1_0101;
                    always_comb y_input_14_layer_1_0101[0] = a2[334]; // wire
                    always_comb y_input_14_layer_1_0101[1] = a2[366]; // wire
                mux2 mux_input_14_layer1_0101(.a(y_input_14_layer_1_0101), .s(s[0]), .y(y_input_14_layer_2_010[1]));
            mux2 mux_input_14_layer2_010 (.a(y_input_14_layer_2_010), .s(s[1]), .y(y_input_14_layer_3_01[0]));
            logic [1:0] y_input_14_layer_2_011;
                logic [1:0] y_input_14_layer_1_0110;
                    always_comb y_input_14_layer_1_0110[0] = a2[398]; // wire
                    always_comb y_input_14_layer_1_0110[1] = a2[430]; // wire
                mux2 mux_input_14_layer1_0110(.a(y_input_14_layer_1_0110), .s(s[0]), .y(y_input_14_layer_2_011[0]));
                logic [1:0] y_input_14_layer_1_0111;
                    always_comb y_input_14_layer_1_0111[0] = a2[462]; // wire
                    always_comb y_input_14_layer_1_0111[1] = a2[494]; // wire
                mux2 mux_input_14_layer1_0111(.a(y_input_14_layer_1_0111), .s(s[0]), .y(y_input_14_layer_2_011[1]));
            mux2 mux_input_14_layer2_011 (.a(y_input_14_layer_2_011), .s(s[1]), .y(y_input_14_layer_3_01[1]));
        mux2 mux_input_14_layer3_01  (.a(y_input_14_layer_3_01), .s(s[2]), .y(y_input_14_layer_4_0[1]));
    mux2 mux_input_14_layer4_0   (.a(y_input_14_layer_4_0), .s(s[3]), .y(y[14]));
            
            ////////////////////////   INPUT WIRE 15   ////////////////////////
            
    logic [1:0] y_input_15_layer_4_0;
        logic [1:0] y_input_15_layer_3_00;
            logic [1:0] y_input_15_layer_2_000;
                logic [1:0] y_input_15_layer_1_0000;
                    always_comb y_input_15_layer_1_0000[0] = a2[15]; // wire
                    always_comb y_input_15_layer_1_0000[1] = a2[47]; // wire
                mux2 mux_input_15_layer1_0000(.a(y_input_15_layer_1_0000), .s(s[0]), .y(y_input_15_layer_2_000[0]));
                logic [1:0] y_input_15_layer_1_0001;
                    always_comb y_input_15_layer_1_0001[0] = a2[79]; // wire
                    always_comb y_input_15_layer_1_0001[1] = a2[111]; // wire
                mux2 mux_input_15_layer1_0001(.a(y_input_15_layer_1_0001), .s(s[0]), .y(y_input_15_layer_2_000[1]));
            mux2 mux_input_15_layer2_000 (.a(y_input_15_layer_2_000), .s(s[1]), .y(y_input_15_layer_3_00[0]));
            logic [1:0] y_input_15_layer_2_001;
                logic [1:0] y_input_15_layer_1_0010;
                    always_comb y_input_15_layer_1_0010[0] = a2[143]; // wire
                    always_comb y_input_15_layer_1_0010[1] = a2[175]; // wire
                mux2 mux_input_15_layer1_0010(.a(y_input_15_layer_1_0010), .s(s[0]), .y(y_input_15_layer_2_001[0]));
                logic [1:0] y_input_15_layer_1_0011;
                    always_comb y_input_15_layer_1_0011[0] = a2[207]; // wire
                    always_comb y_input_15_layer_1_0011[1] = a2[239]; // wire
                mux2 mux_input_15_layer1_0011(.a(y_input_15_layer_1_0011), .s(s[0]), .y(y_input_15_layer_2_001[1]));
            mux2 mux_input_15_layer2_001 (.a(y_input_15_layer_2_001), .s(s[1]), .y(y_input_15_layer_3_00[1]));
        mux2 mux_input_15_layer3_00  (.a(y_input_15_layer_3_00), .s(s[2]), .y(y_input_15_layer_4_0[0]));
        logic [1:0] y_input_15_layer_3_01;
            logic [1:0] y_input_15_layer_2_010;
                logic [1:0] y_input_15_layer_1_0100;
                    always_comb y_input_15_layer_1_0100[0] = a2[271]; // wire
                    always_comb y_input_15_layer_1_0100[1] = a2[303]; // wire
                mux2 mux_input_15_layer1_0100(.a(y_input_15_layer_1_0100), .s(s[0]), .y(y_input_15_layer_2_010[0]));
                logic [1:0] y_input_15_layer_1_0101;
                    always_comb y_input_15_layer_1_0101[0] = a2[335]; // wire
                    always_comb y_input_15_layer_1_0101[1] = a2[367]; // wire
                mux2 mux_input_15_layer1_0101(.a(y_input_15_layer_1_0101), .s(s[0]), .y(y_input_15_layer_2_010[1]));
            mux2 mux_input_15_layer2_010 (.a(y_input_15_layer_2_010), .s(s[1]), .y(y_input_15_layer_3_01[0]));
            logic [1:0] y_input_15_layer_2_011;
                logic [1:0] y_input_15_layer_1_0110;
                    always_comb y_input_15_layer_1_0110[0] = a2[399]; // wire
                    always_comb y_input_15_layer_1_0110[1] = a2[431]; // wire
                mux2 mux_input_15_layer1_0110(.a(y_input_15_layer_1_0110), .s(s[0]), .y(y_input_15_layer_2_011[0]));
                logic [1:0] y_input_15_layer_1_0111;
                    always_comb y_input_15_layer_1_0111[0] = a2[463]; // wire
                    always_comb y_input_15_layer_1_0111[1] = a2[495]; // wire
                mux2 mux_input_15_layer1_0111(.a(y_input_15_layer_1_0111), .s(s[0]), .y(y_input_15_layer_2_011[1]));
            mux2 mux_input_15_layer2_011 (.a(y_input_15_layer_2_011), .s(s[1]), .y(y_input_15_layer_3_01[1]));
        mux2 mux_input_15_layer3_01  (.a(y_input_15_layer_3_01), .s(s[2]), .y(y_input_15_layer_4_0[1]));
    mux2 mux_input_15_layer4_0   (.a(y_input_15_layer_4_0), .s(s[3]), .y(y[15]));
            
            ////////////////////////   INPUT WIRE 16   ////////////////////////
            
    logic [1:0] y_input_16_layer_4_0;
        logic [1:0] y_input_16_layer_3_00;
            logic [1:0] y_input_16_layer_2_000;
                logic [1:0] y_input_16_layer_1_0000;
                    always_comb y_input_16_layer_1_0000[0] = a2[16]; // wire
                    always_comb y_input_16_layer_1_0000[1] = a2[48]; // wire
                mux2 mux_input_16_layer1_0000(.a(y_input_16_layer_1_0000), .s(s[0]), .y(y_input_16_layer_2_000[0]));
                logic [1:0] y_input_16_layer_1_0001;
                    always_comb y_input_16_layer_1_0001[0] = a2[80]; // wire
                    always_comb y_input_16_layer_1_0001[1] = a2[112]; // wire
                mux2 mux_input_16_layer1_0001(.a(y_input_16_layer_1_0001), .s(s[0]), .y(y_input_16_layer_2_000[1]));
            mux2 mux_input_16_layer2_000 (.a(y_input_16_layer_2_000), .s(s[1]), .y(y_input_16_layer_3_00[0]));
            logic [1:0] y_input_16_layer_2_001;
                logic [1:0] y_input_16_layer_1_0010;
                    always_comb y_input_16_layer_1_0010[0] = a2[144]; // wire
                    always_comb y_input_16_layer_1_0010[1] = a2[176]; // wire
                mux2 mux_input_16_layer1_0010(.a(y_input_16_layer_1_0010), .s(s[0]), .y(y_input_16_layer_2_001[0]));
                logic [1:0] y_input_16_layer_1_0011;
                    always_comb y_input_16_layer_1_0011[0] = a2[208]; // wire
                    always_comb y_input_16_layer_1_0011[1] = a2[240]; // wire
                mux2 mux_input_16_layer1_0011(.a(y_input_16_layer_1_0011), .s(s[0]), .y(y_input_16_layer_2_001[1]));
            mux2 mux_input_16_layer2_001 (.a(y_input_16_layer_2_001), .s(s[1]), .y(y_input_16_layer_3_00[1]));
        mux2 mux_input_16_layer3_00  (.a(y_input_16_layer_3_00), .s(s[2]), .y(y_input_16_layer_4_0[0]));
        logic [1:0] y_input_16_layer_3_01;
            logic [1:0] y_input_16_layer_2_010;
                logic [1:0] y_input_16_layer_1_0100;
                    always_comb y_input_16_layer_1_0100[0] = a2[272]; // wire
                    always_comb y_input_16_layer_1_0100[1] = a2[304]; // wire
                mux2 mux_input_16_layer1_0100(.a(y_input_16_layer_1_0100), .s(s[0]), .y(y_input_16_layer_2_010[0]));
                logic [1:0] y_input_16_layer_1_0101;
                    always_comb y_input_16_layer_1_0101[0] = a2[336]; // wire
                    always_comb y_input_16_layer_1_0101[1] = a2[368]; // wire
                mux2 mux_input_16_layer1_0101(.a(y_input_16_layer_1_0101), .s(s[0]), .y(y_input_16_layer_2_010[1]));
            mux2 mux_input_16_layer2_010 (.a(y_input_16_layer_2_010), .s(s[1]), .y(y_input_16_layer_3_01[0]));
            logic [1:0] y_input_16_layer_2_011;
                logic [1:0] y_input_16_layer_1_0110;
                    always_comb y_input_16_layer_1_0110[0] = a2[400]; // wire
                    always_comb y_input_16_layer_1_0110[1] = a2[432]; // wire
                mux2 mux_input_16_layer1_0110(.a(y_input_16_layer_1_0110), .s(s[0]), .y(y_input_16_layer_2_011[0]));
                logic [1:0] y_input_16_layer_1_0111;
                    always_comb y_input_16_layer_1_0111[0] = a2[464]; // wire
                    always_comb y_input_16_layer_1_0111[1] = a2[496]; // wire
                mux2 mux_input_16_layer1_0111(.a(y_input_16_layer_1_0111), .s(s[0]), .y(y_input_16_layer_2_011[1]));
            mux2 mux_input_16_layer2_011 (.a(y_input_16_layer_2_011), .s(s[1]), .y(y_input_16_layer_3_01[1]));
        mux2 mux_input_16_layer3_01  (.a(y_input_16_layer_3_01), .s(s[2]), .y(y_input_16_layer_4_0[1]));
    mux2 mux_input_16_layer4_0   (.a(y_input_16_layer_4_0), .s(s[3]), .y(y[16]));
            
            ////////////////////////   INPUT WIRE 17   ////////////////////////
            
    logic [1:0] y_input_17_layer_4_0;
        logic [1:0] y_input_17_layer_3_00;
            logic [1:0] y_input_17_layer_2_000;
                logic [1:0] y_input_17_layer_1_0000;
                    always_comb y_input_17_layer_1_0000[0] = a2[17]; // wire
                    always_comb y_input_17_layer_1_0000[1] = a2[49]; // wire
                mux2 mux_input_17_layer1_0000(.a(y_input_17_layer_1_0000), .s(s[0]), .y(y_input_17_layer_2_000[0]));
                logic [1:0] y_input_17_layer_1_0001;
                    always_comb y_input_17_layer_1_0001[0] = a2[81]; // wire
                    always_comb y_input_17_layer_1_0001[1] = a2[113]; // wire
                mux2 mux_input_17_layer1_0001(.a(y_input_17_layer_1_0001), .s(s[0]), .y(y_input_17_layer_2_000[1]));
            mux2 mux_input_17_layer2_000 (.a(y_input_17_layer_2_000), .s(s[1]), .y(y_input_17_layer_3_00[0]));
            logic [1:0] y_input_17_layer_2_001;
                logic [1:0] y_input_17_layer_1_0010;
                    always_comb y_input_17_layer_1_0010[0] = a2[145]; // wire
                    always_comb y_input_17_layer_1_0010[1] = a2[177]; // wire
                mux2 mux_input_17_layer1_0010(.a(y_input_17_layer_1_0010), .s(s[0]), .y(y_input_17_layer_2_001[0]));
                logic [1:0] y_input_17_layer_1_0011;
                    always_comb y_input_17_layer_1_0011[0] = a2[209]; // wire
                    always_comb y_input_17_layer_1_0011[1] = a2[241]; // wire
                mux2 mux_input_17_layer1_0011(.a(y_input_17_layer_1_0011), .s(s[0]), .y(y_input_17_layer_2_001[1]));
            mux2 mux_input_17_layer2_001 (.a(y_input_17_layer_2_001), .s(s[1]), .y(y_input_17_layer_3_00[1]));
        mux2 mux_input_17_layer3_00  (.a(y_input_17_layer_3_00), .s(s[2]), .y(y_input_17_layer_4_0[0]));
        logic [1:0] y_input_17_layer_3_01;
            logic [1:0] y_input_17_layer_2_010;
                logic [1:0] y_input_17_layer_1_0100;
                    always_comb y_input_17_layer_1_0100[0] = a2[273]; // wire
                    always_comb y_input_17_layer_1_0100[1] = a2[305]; // wire
                mux2 mux_input_17_layer1_0100(.a(y_input_17_layer_1_0100), .s(s[0]), .y(y_input_17_layer_2_010[0]));
                logic [1:0] y_input_17_layer_1_0101;
                    always_comb y_input_17_layer_1_0101[0] = a2[337]; // wire
                    always_comb y_input_17_layer_1_0101[1] = a2[369]; // wire
                mux2 mux_input_17_layer1_0101(.a(y_input_17_layer_1_0101), .s(s[0]), .y(y_input_17_layer_2_010[1]));
            mux2 mux_input_17_layer2_010 (.a(y_input_17_layer_2_010), .s(s[1]), .y(y_input_17_layer_3_01[0]));
            logic [1:0] y_input_17_layer_2_011;
                logic [1:0] y_input_17_layer_1_0110;
                    always_comb y_input_17_layer_1_0110[0] = a2[401]; // wire
                    always_comb y_input_17_layer_1_0110[1] = a2[433]; // wire
                mux2 mux_input_17_layer1_0110(.a(y_input_17_layer_1_0110), .s(s[0]), .y(y_input_17_layer_2_011[0]));
                logic [1:0] y_input_17_layer_1_0111;
                    always_comb y_input_17_layer_1_0111[0] = a2[465]; // wire
                    always_comb y_input_17_layer_1_0111[1] = a2[497]; // wire
                mux2 mux_input_17_layer1_0111(.a(y_input_17_layer_1_0111), .s(s[0]), .y(y_input_17_layer_2_011[1]));
            mux2 mux_input_17_layer2_011 (.a(y_input_17_layer_2_011), .s(s[1]), .y(y_input_17_layer_3_01[1]));
        mux2 mux_input_17_layer3_01  (.a(y_input_17_layer_3_01), .s(s[2]), .y(y_input_17_layer_4_0[1]));
    mux2 mux_input_17_layer4_0   (.a(y_input_17_layer_4_0), .s(s[3]), .y(y[17]));
            
            ////////////////////////   INPUT WIRE 18   ////////////////////////
            
    logic [1:0] y_input_18_layer_4_0;
        logic [1:0] y_input_18_layer_3_00;
            logic [1:0] y_input_18_layer_2_000;
                logic [1:0] y_input_18_layer_1_0000;
                    always_comb y_input_18_layer_1_0000[0] = a2[18]; // wire
                    always_comb y_input_18_layer_1_0000[1] = a2[50]; // wire
                mux2 mux_input_18_layer1_0000(.a(y_input_18_layer_1_0000), .s(s[0]), .y(y_input_18_layer_2_000[0]));
                logic [1:0] y_input_18_layer_1_0001;
                    always_comb y_input_18_layer_1_0001[0] = a2[82]; // wire
                    always_comb y_input_18_layer_1_0001[1] = a2[114]; // wire
                mux2 mux_input_18_layer1_0001(.a(y_input_18_layer_1_0001), .s(s[0]), .y(y_input_18_layer_2_000[1]));
            mux2 mux_input_18_layer2_000 (.a(y_input_18_layer_2_000), .s(s[1]), .y(y_input_18_layer_3_00[0]));
            logic [1:0] y_input_18_layer_2_001;
                logic [1:0] y_input_18_layer_1_0010;
                    always_comb y_input_18_layer_1_0010[0] = a2[146]; // wire
                    always_comb y_input_18_layer_1_0010[1] = a2[178]; // wire
                mux2 mux_input_18_layer1_0010(.a(y_input_18_layer_1_0010), .s(s[0]), .y(y_input_18_layer_2_001[0]));
                logic [1:0] y_input_18_layer_1_0011;
                    always_comb y_input_18_layer_1_0011[0] = a2[210]; // wire
                    always_comb y_input_18_layer_1_0011[1] = a2[242]; // wire
                mux2 mux_input_18_layer1_0011(.a(y_input_18_layer_1_0011), .s(s[0]), .y(y_input_18_layer_2_001[1]));
            mux2 mux_input_18_layer2_001 (.a(y_input_18_layer_2_001), .s(s[1]), .y(y_input_18_layer_3_00[1]));
        mux2 mux_input_18_layer3_00  (.a(y_input_18_layer_3_00), .s(s[2]), .y(y_input_18_layer_4_0[0]));
        logic [1:0] y_input_18_layer_3_01;
            logic [1:0] y_input_18_layer_2_010;
                logic [1:0] y_input_18_layer_1_0100;
                    always_comb y_input_18_layer_1_0100[0] = a2[274]; // wire
                    always_comb y_input_18_layer_1_0100[1] = a2[306]; // wire
                mux2 mux_input_18_layer1_0100(.a(y_input_18_layer_1_0100), .s(s[0]), .y(y_input_18_layer_2_010[0]));
                logic [1:0] y_input_18_layer_1_0101;
                    always_comb y_input_18_layer_1_0101[0] = a2[338]; // wire
                    always_comb y_input_18_layer_1_0101[1] = a2[370]; // wire
                mux2 mux_input_18_layer1_0101(.a(y_input_18_layer_1_0101), .s(s[0]), .y(y_input_18_layer_2_010[1]));
            mux2 mux_input_18_layer2_010 (.a(y_input_18_layer_2_010), .s(s[1]), .y(y_input_18_layer_3_01[0]));
            logic [1:0] y_input_18_layer_2_011;
                logic [1:0] y_input_18_layer_1_0110;
                    always_comb y_input_18_layer_1_0110[0] = a2[402]; // wire
                    always_comb y_input_18_layer_1_0110[1] = a2[434]; // wire
                mux2 mux_input_18_layer1_0110(.a(y_input_18_layer_1_0110), .s(s[0]), .y(y_input_18_layer_2_011[0]));
                logic [1:0] y_input_18_layer_1_0111;
                    always_comb y_input_18_layer_1_0111[0] = a2[466]; // wire
                    always_comb y_input_18_layer_1_0111[1] = a2[498]; // wire
                mux2 mux_input_18_layer1_0111(.a(y_input_18_layer_1_0111), .s(s[0]), .y(y_input_18_layer_2_011[1]));
            mux2 mux_input_18_layer2_011 (.a(y_input_18_layer_2_011), .s(s[1]), .y(y_input_18_layer_3_01[1]));
        mux2 mux_input_18_layer3_01  (.a(y_input_18_layer_3_01), .s(s[2]), .y(y_input_18_layer_4_0[1]));
    mux2 mux_input_18_layer4_0   (.a(y_input_18_layer_4_0), .s(s[3]), .y(y[18]));
            
            ////////////////////////   INPUT WIRE 19   ////////////////////////
            
    logic [1:0] y_input_19_layer_4_0;
        logic [1:0] y_input_19_layer_3_00;
            logic [1:0] y_input_19_layer_2_000;
                logic [1:0] y_input_19_layer_1_0000;
                    always_comb y_input_19_layer_1_0000[0] = a2[19]; // wire
                    always_comb y_input_19_layer_1_0000[1] = a2[51]; // wire
                mux2 mux_input_19_layer1_0000(.a(y_input_19_layer_1_0000), .s(s[0]), .y(y_input_19_layer_2_000[0]));
                logic [1:0] y_input_19_layer_1_0001;
                    always_comb y_input_19_layer_1_0001[0] = a2[83]; // wire
                    always_comb y_input_19_layer_1_0001[1] = a2[115]; // wire
                mux2 mux_input_19_layer1_0001(.a(y_input_19_layer_1_0001), .s(s[0]), .y(y_input_19_layer_2_000[1]));
            mux2 mux_input_19_layer2_000 (.a(y_input_19_layer_2_000), .s(s[1]), .y(y_input_19_layer_3_00[0]));
            logic [1:0] y_input_19_layer_2_001;
                logic [1:0] y_input_19_layer_1_0010;
                    always_comb y_input_19_layer_1_0010[0] = a2[147]; // wire
                    always_comb y_input_19_layer_1_0010[1] = a2[179]; // wire
                mux2 mux_input_19_layer1_0010(.a(y_input_19_layer_1_0010), .s(s[0]), .y(y_input_19_layer_2_001[0]));
                logic [1:0] y_input_19_layer_1_0011;
                    always_comb y_input_19_layer_1_0011[0] = a2[211]; // wire
                    always_comb y_input_19_layer_1_0011[1] = a2[243]; // wire
                mux2 mux_input_19_layer1_0011(.a(y_input_19_layer_1_0011), .s(s[0]), .y(y_input_19_layer_2_001[1]));
            mux2 mux_input_19_layer2_001 (.a(y_input_19_layer_2_001), .s(s[1]), .y(y_input_19_layer_3_00[1]));
        mux2 mux_input_19_layer3_00  (.a(y_input_19_layer_3_00), .s(s[2]), .y(y_input_19_layer_4_0[0]));
        logic [1:0] y_input_19_layer_3_01;
            logic [1:0] y_input_19_layer_2_010;
                logic [1:0] y_input_19_layer_1_0100;
                    always_comb y_input_19_layer_1_0100[0] = a2[275]; // wire
                    always_comb y_input_19_layer_1_0100[1] = a2[307]; // wire
                mux2 mux_input_19_layer1_0100(.a(y_input_19_layer_1_0100), .s(s[0]), .y(y_input_19_layer_2_010[0]));
                logic [1:0] y_input_19_layer_1_0101;
                    always_comb y_input_19_layer_1_0101[0] = a2[339]; // wire
                    always_comb y_input_19_layer_1_0101[1] = a2[371]; // wire
                mux2 mux_input_19_layer1_0101(.a(y_input_19_layer_1_0101), .s(s[0]), .y(y_input_19_layer_2_010[1]));
            mux2 mux_input_19_layer2_010 (.a(y_input_19_layer_2_010), .s(s[1]), .y(y_input_19_layer_3_01[0]));
            logic [1:0] y_input_19_layer_2_011;
                logic [1:0] y_input_19_layer_1_0110;
                    always_comb y_input_19_layer_1_0110[0] = a2[403]; // wire
                    always_comb y_input_19_layer_1_0110[1] = a2[435]; // wire
                mux2 mux_input_19_layer1_0110(.a(y_input_19_layer_1_0110), .s(s[0]), .y(y_input_19_layer_2_011[0]));
                logic [1:0] y_input_19_layer_1_0111;
                    always_comb y_input_19_layer_1_0111[0] = a2[467]; // wire
                    always_comb y_input_19_layer_1_0111[1] = a2[499]; // wire
                mux2 mux_input_19_layer1_0111(.a(y_input_19_layer_1_0111), .s(s[0]), .y(y_input_19_layer_2_011[1]));
            mux2 mux_input_19_layer2_011 (.a(y_input_19_layer_2_011), .s(s[1]), .y(y_input_19_layer_3_01[1]));
        mux2 mux_input_19_layer3_01  (.a(y_input_19_layer_3_01), .s(s[2]), .y(y_input_19_layer_4_0[1]));
    mux2 mux_input_19_layer4_0   (.a(y_input_19_layer_4_0), .s(s[3]), .y(y[19]));
            
            ////////////////////////   INPUT WIRE 20   ////////////////////////
            
    logic [1:0] y_input_20_layer_4_0;
        logic [1:0] y_input_20_layer_3_00;
            logic [1:0] y_input_20_layer_2_000;
                logic [1:0] y_input_20_layer_1_0000;
                    always_comb y_input_20_layer_1_0000[0] = a2[20]; // wire
                    always_comb y_input_20_layer_1_0000[1] = a2[52]; // wire
                mux2 mux_input_20_layer1_0000(.a(y_input_20_layer_1_0000), .s(s[0]), .y(y_input_20_layer_2_000[0]));
                logic [1:0] y_input_20_layer_1_0001;
                    always_comb y_input_20_layer_1_0001[0] = a2[84]; // wire
                    always_comb y_input_20_layer_1_0001[1] = a2[116]; // wire
                mux2 mux_input_20_layer1_0001(.a(y_input_20_layer_1_0001), .s(s[0]), .y(y_input_20_layer_2_000[1]));
            mux2 mux_input_20_layer2_000 (.a(y_input_20_layer_2_000), .s(s[1]), .y(y_input_20_layer_3_00[0]));
            logic [1:0] y_input_20_layer_2_001;
                logic [1:0] y_input_20_layer_1_0010;
                    always_comb y_input_20_layer_1_0010[0] = a2[148]; // wire
                    always_comb y_input_20_layer_1_0010[1] = a2[180]; // wire
                mux2 mux_input_20_layer1_0010(.a(y_input_20_layer_1_0010), .s(s[0]), .y(y_input_20_layer_2_001[0]));
                logic [1:0] y_input_20_layer_1_0011;
                    always_comb y_input_20_layer_1_0011[0] = a2[212]; // wire
                    always_comb y_input_20_layer_1_0011[1] = a2[244]; // wire
                mux2 mux_input_20_layer1_0011(.a(y_input_20_layer_1_0011), .s(s[0]), .y(y_input_20_layer_2_001[1]));
            mux2 mux_input_20_layer2_001 (.a(y_input_20_layer_2_001), .s(s[1]), .y(y_input_20_layer_3_00[1]));
        mux2 mux_input_20_layer3_00  (.a(y_input_20_layer_3_00), .s(s[2]), .y(y_input_20_layer_4_0[0]));
        logic [1:0] y_input_20_layer_3_01;
            logic [1:0] y_input_20_layer_2_010;
                logic [1:0] y_input_20_layer_1_0100;
                    always_comb y_input_20_layer_1_0100[0] = a2[276]; // wire
                    always_comb y_input_20_layer_1_0100[1] = a2[308]; // wire
                mux2 mux_input_20_layer1_0100(.a(y_input_20_layer_1_0100), .s(s[0]), .y(y_input_20_layer_2_010[0]));
                logic [1:0] y_input_20_layer_1_0101;
                    always_comb y_input_20_layer_1_0101[0] = a2[340]; // wire
                    always_comb y_input_20_layer_1_0101[1] = a2[372]; // wire
                mux2 mux_input_20_layer1_0101(.a(y_input_20_layer_1_0101), .s(s[0]), .y(y_input_20_layer_2_010[1]));
            mux2 mux_input_20_layer2_010 (.a(y_input_20_layer_2_010), .s(s[1]), .y(y_input_20_layer_3_01[0]));
            logic [1:0] y_input_20_layer_2_011;
                logic [1:0] y_input_20_layer_1_0110;
                    always_comb y_input_20_layer_1_0110[0] = a2[404]; // wire
                    always_comb y_input_20_layer_1_0110[1] = a2[436]; // wire
                mux2 mux_input_20_layer1_0110(.a(y_input_20_layer_1_0110), .s(s[0]), .y(y_input_20_layer_2_011[0]));
                logic [1:0] y_input_20_layer_1_0111;
                    always_comb y_input_20_layer_1_0111[0] = a2[468]; // wire
                    always_comb y_input_20_layer_1_0111[1] = a2[500]; // wire
                mux2 mux_input_20_layer1_0111(.a(y_input_20_layer_1_0111), .s(s[0]), .y(y_input_20_layer_2_011[1]));
            mux2 mux_input_20_layer2_011 (.a(y_input_20_layer_2_011), .s(s[1]), .y(y_input_20_layer_3_01[1]));
        mux2 mux_input_20_layer3_01  (.a(y_input_20_layer_3_01), .s(s[2]), .y(y_input_20_layer_4_0[1]));
    mux2 mux_input_20_layer4_0   (.a(y_input_20_layer_4_0), .s(s[3]), .y(y[20]));
            
            ////////////////////////   INPUT WIRE 21   ////////////////////////
            
    logic [1:0] y_input_21_layer_4_0;
        logic [1:0] y_input_21_layer_3_00;
            logic [1:0] y_input_21_layer_2_000;
                logic [1:0] y_input_21_layer_1_0000;
                    always_comb y_input_21_layer_1_0000[0] = a2[21]; // wire
                    always_comb y_input_21_layer_1_0000[1] = a2[53]; // wire
                mux2 mux_input_21_layer1_0000(.a(y_input_21_layer_1_0000), .s(s[0]), .y(y_input_21_layer_2_000[0]));
                logic [1:0] y_input_21_layer_1_0001;
                    always_comb y_input_21_layer_1_0001[0] = a2[85]; // wire
                    always_comb y_input_21_layer_1_0001[1] = a2[117]; // wire
                mux2 mux_input_21_layer1_0001(.a(y_input_21_layer_1_0001), .s(s[0]), .y(y_input_21_layer_2_000[1]));
            mux2 mux_input_21_layer2_000 (.a(y_input_21_layer_2_000), .s(s[1]), .y(y_input_21_layer_3_00[0]));
            logic [1:0] y_input_21_layer_2_001;
                logic [1:0] y_input_21_layer_1_0010;
                    always_comb y_input_21_layer_1_0010[0] = a2[149]; // wire
                    always_comb y_input_21_layer_1_0010[1] = a2[181]; // wire
                mux2 mux_input_21_layer1_0010(.a(y_input_21_layer_1_0010), .s(s[0]), .y(y_input_21_layer_2_001[0]));
                logic [1:0] y_input_21_layer_1_0011;
                    always_comb y_input_21_layer_1_0011[0] = a2[213]; // wire
                    always_comb y_input_21_layer_1_0011[1] = a2[245]; // wire
                mux2 mux_input_21_layer1_0011(.a(y_input_21_layer_1_0011), .s(s[0]), .y(y_input_21_layer_2_001[1]));
            mux2 mux_input_21_layer2_001 (.a(y_input_21_layer_2_001), .s(s[1]), .y(y_input_21_layer_3_00[1]));
        mux2 mux_input_21_layer3_00  (.a(y_input_21_layer_3_00), .s(s[2]), .y(y_input_21_layer_4_0[0]));
        logic [1:0] y_input_21_layer_3_01;
            logic [1:0] y_input_21_layer_2_010;
                logic [1:0] y_input_21_layer_1_0100;
                    always_comb y_input_21_layer_1_0100[0] = a2[277]; // wire
                    always_comb y_input_21_layer_1_0100[1] = a2[309]; // wire
                mux2 mux_input_21_layer1_0100(.a(y_input_21_layer_1_0100), .s(s[0]), .y(y_input_21_layer_2_010[0]));
                logic [1:0] y_input_21_layer_1_0101;
                    always_comb y_input_21_layer_1_0101[0] = a2[341]; // wire
                    always_comb y_input_21_layer_1_0101[1] = a2[373]; // wire
                mux2 mux_input_21_layer1_0101(.a(y_input_21_layer_1_0101), .s(s[0]), .y(y_input_21_layer_2_010[1]));
            mux2 mux_input_21_layer2_010 (.a(y_input_21_layer_2_010), .s(s[1]), .y(y_input_21_layer_3_01[0]));
            logic [1:0] y_input_21_layer_2_011;
                logic [1:0] y_input_21_layer_1_0110;
                    always_comb y_input_21_layer_1_0110[0] = a2[405]; // wire
                    always_comb y_input_21_layer_1_0110[1] = a2[437]; // wire
                mux2 mux_input_21_layer1_0110(.a(y_input_21_layer_1_0110), .s(s[0]), .y(y_input_21_layer_2_011[0]));
                logic [1:0] y_input_21_layer_1_0111;
                    always_comb y_input_21_layer_1_0111[0] = a2[469]; // wire
                    always_comb y_input_21_layer_1_0111[1] = a2[501]; // wire
                mux2 mux_input_21_layer1_0111(.a(y_input_21_layer_1_0111), .s(s[0]), .y(y_input_21_layer_2_011[1]));
            mux2 mux_input_21_layer2_011 (.a(y_input_21_layer_2_011), .s(s[1]), .y(y_input_21_layer_3_01[1]));
        mux2 mux_input_21_layer3_01  (.a(y_input_21_layer_3_01), .s(s[2]), .y(y_input_21_layer_4_0[1]));
    mux2 mux_input_21_layer4_0   (.a(y_input_21_layer_4_0), .s(s[3]), .y(y[21]));
            
            ////////////////////////   INPUT WIRE 22   ////////////////////////
            
    logic [1:0] y_input_22_layer_4_0;
        logic [1:0] y_input_22_layer_3_00;
            logic [1:0] y_input_22_layer_2_000;
                logic [1:0] y_input_22_layer_1_0000;
                    always_comb y_input_22_layer_1_0000[0] = a2[22]; // wire
                    always_comb y_input_22_layer_1_0000[1] = a2[54]; // wire
                mux2 mux_input_22_layer1_0000(.a(y_input_22_layer_1_0000), .s(s[0]), .y(y_input_22_layer_2_000[0]));
                logic [1:0] y_input_22_layer_1_0001;
                    always_comb y_input_22_layer_1_0001[0] = a2[86]; // wire
                    always_comb y_input_22_layer_1_0001[1] = a2[118]; // wire
                mux2 mux_input_22_layer1_0001(.a(y_input_22_layer_1_0001), .s(s[0]), .y(y_input_22_layer_2_000[1]));
            mux2 mux_input_22_layer2_000 (.a(y_input_22_layer_2_000), .s(s[1]), .y(y_input_22_layer_3_00[0]));
            logic [1:0] y_input_22_layer_2_001;
                logic [1:0] y_input_22_layer_1_0010;
                    always_comb y_input_22_layer_1_0010[0] = a2[150]; // wire
                    always_comb y_input_22_layer_1_0010[1] = a2[182]; // wire
                mux2 mux_input_22_layer1_0010(.a(y_input_22_layer_1_0010), .s(s[0]), .y(y_input_22_layer_2_001[0]));
                logic [1:0] y_input_22_layer_1_0011;
                    always_comb y_input_22_layer_1_0011[0] = a2[214]; // wire
                    always_comb y_input_22_layer_1_0011[1] = a2[246]; // wire
                mux2 mux_input_22_layer1_0011(.a(y_input_22_layer_1_0011), .s(s[0]), .y(y_input_22_layer_2_001[1]));
            mux2 mux_input_22_layer2_001 (.a(y_input_22_layer_2_001), .s(s[1]), .y(y_input_22_layer_3_00[1]));
        mux2 mux_input_22_layer3_00  (.a(y_input_22_layer_3_00), .s(s[2]), .y(y_input_22_layer_4_0[0]));
        logic [1:0] y_input_22_layer_3_01;
            logic [1:0] y_input_22_layer_2_010;
                logic [1:0] y_input_22_layer_1_0100;
                    always_comb y_input_22_layer_1_0100[0] = a2[278]; // wire
                    always_comb y_input_22_layer_1_0100[1] = a2[310]; // wire
                mux2 mux_input_22_layer1_0100(.a(y_input_22_layer_1_0100), .s(s[0]), .y(y_input_22_layer_2_010[0]));
                logic [1:0] y_input_22_layer_1_0101;
                    always_comb y_input_22_layer_1_0101[0] = a2[342]; // wire
                    always_comb y_input_22_layer_1_0101[1] = a2[374]; // wire
                mux2 mux_input_22_layer1_0101(.a(y_input_22_layer_1_0101), .s(s[0]), .y(y_input_22_layer_2_010[1]));
            mux2 mux_input_22_layer2_010 (.a(y_input_22_layer_2_010), .s(s[1]), .y(y_input_22_layer_3_01[0]));
            logic [1:0] y_input_22_layer_2_011;
                logic [1:0] y_input_22_layer_1_0110;
                    always_comb y_input_22_layer_1_0110[0] = a2[406]; // wire
                    always_comb y_input_22_layer_1_0110[1] = a2[438]; // wire
                mux2 mux_input_22_layer1_0110(.a(y_input_22_layer_1_0110), .s(s[0]), .y(y_input_22_layer_2_011[0]));
                logic [1:0] y_input_22_layer_1_0111;
                    always_comb y_input_22_layer_1_0111[0] = a2[470]; // wire
                    always_comb y_input_22_layer_1_0111[1] = a2[502]; // wire
                mux2 mux_input_22_layer1_0111(.a(y_input_22_layer_1_0111), .s(s[0]), .y(y_input_22_layer_2_011[1]));
            mux2 mux_input_22_layer2_011 (.a(y_input_22_layer_2_011), .s(s[1]), .y(y_input_22_layer_3_01[1]));
        mux2 mux_input_22_layer3_01  (.a(y_input_22_layer_3_01), .s(s[2]), .y(y_input_22_layer_4_0[1]));
    mux2 mux_input_22_layer4_0   (.a(y_input_22_layer_4_0), .s(s[3]), .y(y[22]));
            
            ////////////////////////   INPUT WIRE 23   ////////////////////////
            
    logic [1:0] y_input_23_layer_4_0;
        logic [1:0] y_input_23_layer_3_00;
            logic [1:0] y_input_23_layer_2_000;
                logic [1:0] y_input_23_layer_1_0000;
                    always_comb y_input_23_layer_1_0000[0] = a2[23]; // wire
                    always_comb y_input_23_layer_1_0000[1] = a2[55]; // wire
                mux2 mux_input_23_layer1_0000(.a(y_input_23_layer_1_0000), .s(s[0]), .y(y_input_23_layer_2_000[0]));
                logic [1:0] y_input_23_layer_1_0001;
                    always_comb y_input_23_layer_1_0001[0] = a2[87]; // wire
                    always_comb y_input_23_layer_1_0001[1] = a2[119]; // wire
                mux2 mux_input_23_layer1_0001(.a(y_input_23_layer_1_0001), .s(s[0]), .y(y_input_23_layer_2_000[1]));
            mux2 mux_input_23_layer2_000 (.a(y_input_23_layer_2_000), .s(s[1]), .y(y_input_23_layer_3_00[0]));
            logic [1:0] y_input_23_layer_2_001;
                logic [1:0] y_input_23_layer_1_0010;
                    always_comb y_input_23_layer_1_0010[0] = a2[151]; // wire
                    always_comb y_input_23_layer_1_0010[1] = a2[183]; // wire
                mux2 mux_input_23_layer1_0010(.a(y_input_23_layer_1_0010), .s(s[0]), .y(y_input_23_layer_2_001[0]));
                logic [1:0] y_input_23_layer_1_0011;
                    always_comb y_input_23_layer_1_0011[0] = a2[215]; // wire
                    always_comb y_input_23_layer_1_0011[1] = a2[247]; // wire
                mux2 mux_input_23_layer1_0011(.a(y_input_23_layer_1_0011), .s(s[0]), .y(y_input_23_layer_2_001[1]));
            mux2 mux_input_23_layer2_001 (.a(y_input_23_layer_2_001), .s(s[1]), .y(y_input_23_layer_3_00[1]));
        mux2 mux_input_23_layer3_00  (.a(y_input_23_layer_3_00), .s(s[2]), .y(y_input_23_layer_4_0[0]));
        logic [1:0] y_input_23_layer_3_01;
            logic [1:0] y_input_23_layer_2_010;
                logic [1:0] y_input_23_layer_1_0100;
                    always_comb y_input_23_layer_1_0100[0] = a2[279]; // wire
                    always_comb y_input_23_layer_1_0100[1] = a2[311]; // wire
                mux2 mux_input_23_layer1_0100(.a(y_input_23_layer_1_0100), .s(s[0]), .y(y_input_23_layer_2_010[0]));
                logic [1:0] y_input_23_layer_1_0101;
                    always_comb y_input_23_layer_1_0101[0] = a2[343]; // wire
                    always_comb y_input_23_layer_1_0101[1] = a2[375]; // wire
                mux2 mux_input_23_layer1_0101(.a(y_input_23_layer_1_0101), .s(s[0]), .y(y_input_23_layer_2_010[1]));
            mux2 mux_input_23_layer2_010 (.a(y_input_23_layer_2_010), .s(s[1]), .y(y_input_23_layer_3_01[0]));
            logic [1:0] y_input_23_layer_2_011;
                logic [1:0] y_input_23_layer_1_0110;
                    always_comb y_input_23_layer_1_0110[0] = a2[407]; // wire
                    always_comb y_input_23_layer_1_0110[1] = a2[439]; // wire
                mux2 mux_input_23_layer1_0110(.a(y_input_23_layer_1_0110), .s(s[0]), .y(y_input_23_layer_2_011[0]));
                logic [1:0] y_input_23_layer_1_0111;
                    always_comb y_input_23_layer_1_0111[0] = a2[471]; // wire
                    always_comb y_input_23_layer_1_0111[1] = a2[503]; // wire
                mux2 mux_input_23_layer1_0111(.a(y_input_23_layer_1_0111), .s(s[0]), .y(y_input_23_layer_2_011[1]));
            mux2 mux_input_23_layer2_011 (.a(y_input_23_layer_2_011), .s(s[1]), .y(y_input_23_layer_3_01[1]));
        mux2 mux_input_23_layer3_01  (.a(y_input_23_layer_3_01), .s(s[2]), .y(y_input_23_layer_4_0[1]));
    mux2 mux_input_23_layer4_0   (.a(y_input_23_layer_4_0), .s(s[3]), .y(y[23]));
            
            ////////////////////////   INPUT WIRE 24   ////////////////////////
            
    logic [1:0] y_input_24_layer_4_0;
        logic [1:0] y_input_24_layer_3_00;
            logic [1:0] y_input_24_layer_2_000;
                logic [1:0] y_input_24_layer_1_0000;
                    always_comb y_input_24_layer_1_0000[0] = a2[24]; // wire
                    always_comb y_input_24_layer_1_0000[1] = a2[56]; // wire
                mux2 mux_input_24_layer1_0000(.a(y_input_24_layer_1_0000), .s(s[0]), .y(y_input_24_layer_2_000[0]));
                logic [1:0] y_input_24_layer_1_0001;
                    always_comb y_input_24_layer_1_0001[0] = a2[88]; // wire
                    always_comb y_input_24_layer_1_0001[1] = a2[120]; // wire
                mux2 mux_input_24_layer1_0001(.a(y_input_24_layer_1_0001), .s(s[0]), .y(y_input_24_layer_2_000[1]));
            mux2 mux_input_24_layer2_000 (.a(y_input_24_layer_2_000), .s(s[1]), .y(y_input_24_layer_3_00[0]));
            logic [1:0] y_input_24_layer_2_001;
                logic [1:0] y_input_24_layer_1_0010;
                    always_comb y_input_24_layer_1_0010[0] = a2[152]; // wire
                    always_comb y_input_24_layer_1_0010[1] = a2[184]; // wire
                mux2 mux_input_24_layer1_0010(.a(y_input_24_layer_1_0010), .s(s[0]), .y(y_input_24_layer_2_001[0]));
                logic [1:0] y_input_24_layer_1_0011;
                    always_comb y_input_24_layer_1_0011[0] = a2[216]; // wire
                    always_comb y_input_24_layer_1_0011[1] = a2[248]; // wire
                mux2 mux_input_24_layer1_0011(.a(y_input_24_layer_1_0011), .s(s[0]), .y(y_input_24_layer_2_001[1]));
            mux2 mux_input_24_layer2_001 (.a(y_input_24_layer_2_001), .s(s[1]), .y(y_input_24_layer_3_00[1]));
        mux2 mux_input_24_layer3_00  (.a(y_input_24_layer_3_00), .s(s[2]), .y(y_input_24_layer_4_0[0]));
        logic [1:0] y_input_24_layer_3_01;
            logic [1:0] y_input_24_layer_2_010;
                logic [1:0] y_input_24_layer_1_0100;
                    always_comb y_input_24_layer_1_0100[0] = a2[280]; // wire
                    always_comb y_input_24_layer_1_0100[1] = a2[312]; // wire
                mux2 mux_input_24_layer1_0100(.a(y_input_24_layer_1_0100), .s(s[0]), .y(y_input_24_layer_2_010[0]));
                logic [1:0] y_input_24_layer_1_0101;
                    always_comb y_input_24_layer_1_0101[0] = a2[344]; // wire
                    always_comb y_input_24_layer_1_0101[1] = a2[376]; // wire
                mux2 mux_input_24_layer1_0101(.a(y_input_24_layer_1_0101), .s(s[0]), .y(y_input_24_layer_2_010[1]));
            mux2 mux_input_24_layer2_010 (.a(y_input_24_layer_2_010), .s(s[1]), .y(y_input_24_layer_3_01[0]));
            logic [1:0] y_input_24_layer_2_011;
                logic [1:0] y_input_24_layer_1_0110;
                    always_comb y_input_24_layer_1_0110[0] = a2[408]; // wire
                    always_comb y_input_24_layer_1_0110[1] = a2[440]; // wire
                mux2 mux_input_24_layer1_0110(.a(y_input_24_layer_1_0110), .s(s[0]), .y(y_input_24_layer_2_011[0]));
                logic [1:0] y_input_24_layer_1_0111;
                    always_comb y_input_24_layer_1_0111[0] = a2[472]; // wire
                    always_comb y_input_24_layer_1_0111[1] = a2[504]; // wire
                mux2 mux_input_24_layer1_0111(.a(y_input_24_layer_1_0111), .s(s[0]), .y(y_input_24_layer_2_011[1]));
            mux2 mux_input_24_layer2_011 (.a(y_input_24_layer_2_011), .s(s[1]), .y(y_input_24_layer_3_01[1]));
        mux2 mux_input_24_layer3_01  (.a(y_input_24_layer_3_01), .s(s[2]), .y(y_input_24_layer_4_0[1]));
    mux2 mux_input_24_layer4_0   (.a(y_input_24_layer_4_0), .s(s[3]), .y(y[24]));
            
            ////////////////////////   INPUT WIRE 25   ////////////////////////
            
    logic [1:0] y_input_25_layer_4_0;
        logic [1:0] y_input_25_layer_3_00;
            logic [1:0] y_input_25_layer_2_000;
                logic [1:0] y_input_25_layer_1_0000;
                    always_comb y_input_25_layer_1_0000[0] = a2[25]; // wire
                    always_comb y_input_25_layer_1_0000[1] = a2[57]; // wire
                mux2 mux_input_25_layer1_0000(.a(y_input_25_layer_1_0000), .s(s[0]), .y(y_input_25_layer_2_000[0]));
                logic [1:0] y_input_25_layer_1_0001;
                    always_comb y_input_25_layer_1_0001[0] = a2[89]; // wire
                    always_comb y_input_25_layer_1_0001[1] = a2[121]; // wire
                mux2 mux_input_25_layer1_0001(.a(y_input_25_layer_1_0001), .s(s[0]), .y(y_input_25_layer_2_000[1]));
            mux2 mux_input_25_layer2_000 (.a(y_input_25_layer_2_000), .s(s[1]), .y(y_input_25_layer_3_00[0]));
            logic [1:0] y_input_25_layer_2_001;
                logic [1:0] y_input_25_layer_1_0010;
                    always_comb y_input_25_layer_1_0010[0] = a2[153]; // wire
                    always_comb y_input_25_layer_1_0010[1] = a2[185]; // wire
                mux2 mux_input_25_layer1_0010(.a(y_input_25_layer_1_0010), .s(s[0]), .y(y_input_25_layer_2_001[0]));
                logic [1:0] y_input_25_layer_1_0011;
                    always_comb y_input_25_layer_1_0011[0] = a2[217]; // wire
                    always_comb y_input_25_layer_1_0011[1] = a2[249]; // wire
                mux2 mux_input_25_layer1_0011(.a(y_input_25_layer_1_0011), .s(s[0]), .y(y_input_25_layer_2_001[1]));
            mux2 mux_input_25_layer2_001 (.a(y_input_25_layer_2_001), .s(s[1]), .y(y_input_25_layer_3_00[1]));
        mux2 mux_input_25_layer3_00  (.a(y_input_25_layer_3_00), .s(s[2]), .y(y_input_25_layer_4_0[0]));
        logic [1:0] y_input_25_layer_3_01;
            logic [1:0] y_input_25_layer_2_010;
                logic [1:0] y_input_25_layer_1_0100;
                    always_comb y_input_25_layer_1_0100[0] = a2[281]; // wire
                    always_comb y_input_25_layer_1_0100[1] = a2[313]; // wire
                mux2 mux_input_25_layer1_0100(.a(y_input_25_layer_1_0100), .s(s[0]), .y(y_input_25_layer_2_010[0]));
                logic [1:0] y_input_25_layer_1_0101;
                    always_comb y_input_25_layer_1_0101[0] = a2[345]; // wire
                    always_comb y_input_25_layer_1_0101[1] = a2[377]; // wire
                mux2 mux_input_25_layer1_0101(.a(y_input_25_layer_1_0101), .s(s[0]), .y(y_input_25_layer_2_010[1]));
            mux2 mux_input_25_layer2_010 (.a(y_input_25_layer_2_010), .s(s[1]), .y(y_input_25_layer_3_01[0]));
            logic [1:0] y_input_25_layer_2_011;
                logic [1:0] y_input_25_layer_1_0110;
                    always_comb y_input_25_layer_1_0110[0] = a2[409]; // wire
                    always_comb y_input_25_layer_1_0110[1] = a2[441]; // wire
                mux2 mux_input_25_layer1_0110(.a(y_input_25_layer_1_0110), .s(s[0]), .y(y_input_25_layer_2_011[0]));
                logic [1:0] y_input_25_layer_1_0111;
                    always_comb y_input_25_layer_1_0111[0] = a2[473]; // wire
                    always_comb y_input_25_layer_1_0111[1] = a2[505]; // wire
                mux2 mux_input_25_layer1_0111(.a(y_input_25_layer_1_0111), .s(s[0]), .y(y_input_25_layer_2_011[1]));
            mux2 mux_input_25_layer2_011 (.a(y_input_25_layer_2_011), .s(s[1]), .y(y_input_25_layer_3_01[1]));
        mux2 mux_input_25_layer3_01  (.a(y_input_25_layer_3_01), .s(s[2]), .y(y_input_25_layer_4_0[1]));
    mux2 mux_input_25_layer4_0   (.a(y_input_25_layer_4_0), .s(s[3]), .y(y[25]));
            
            ////////////////////////   INPUT WIRE 26   ////////////////////////
            
    logic [1:0] y_input_26_layer_4_0;
        logic [1:0] y_input_26_layer_3_00;
            logic [1:0] y_input_26_layer_2_000;
                logic [1:0] y_input_26_layer_1_0000;
                    always_comb y_input_26_layer_1_0000[0] = a2[26]; // wire
                    always_comb y_input_26_layer_1_0000[1] = a2[58]; // wire
                mux2 mux_input_26_layer1_0000(.a(y_input_26_layer_1_0000), .s(s[0]), .y(y_input_26_layer_2_000[0]));
                logic [1:0] y_input_26_layer_1_0001;
                    always_comb y_input_26_layer_1_0001[0] = a2[90]; // wire
                    always_comb y_input_26_layer_1_0001[1] = a2[122]; // wire
                mux2 mux_input_26_layer1_0001(.a(y_input_26_layer_1_0001), .s(s[0]), .y(y_input_26_layer_2_000[1]));
            mux2 mux_input_26_layer2_000 (.a(y_input_26_layer_2_000), .s(s[1]), .y(y_input_26_layer_3_00[0]));
            logic [1:0] y_input_26_layer_2_001;
                logic [1:0] y_input_26_layer_1_0010;
                    always_comb y_input_26_layer_1_0010[0] = a2[154]; // wire
                    always_comb y_input_26_layer_1_0010[1] = a2[186]; // wire
                mux2 mux_input_26_layer1_0010(.a(y_input_26_layer_1_0010), .s(s[0]), .y(y_input_26_layer_2_001[0]));
                logic [1:0] y_input_26_layer_1_0011;
                    always_comb y_input_26_layer_1_0011[0] = a2[218]; // wire
                    always_comb y_input_26_layer_1_0011[1] = a2[250]; // wire
                mux2 mux_input_26_layer1_0011(.a(y_input_26_layer_1_0011), .s(s[0]), .y(y_input_26_layer_2_001[1]));
            mux2 mux_input_26_layer2_001 (.a(y_input_26_layer_2_001), .s(s[1]), .y(y_input_26_layer_3_00[1]));
        mux2 mux_input_26_layer3_00  (.a(y_input_26_layer_3_00), .s(s[2]), .y(y_input_26_layer_4_0[0]));
        logic [1:0] y_input_26_layer_3_01;
            logic [1:0] y_input_26_layer_2_010;
                logic [1:0] y_input_26_layer_1_0100;
                    always_comb y_input_26_layer_1_0100[0] = a2[282]; // wire
                    always_comb y_input_26_layer_1_0100[1] = a2[314]; // wire
                mux2 mux_input_26_layer1_0100(.a(y_input_26_layer_1_0100), .s(s[0]), .y(y_input_26_layer_2_010[0]));
                logic [1:0] y_input_26_layer_1_0101;
                    always_comb y_input_26_layer_1_0101[0] = a2[346]; // wire
                    always_comb y_input_26_layer_1_0101[1] = a2[378]; // wire
                mux2 mux_input_26_layer1_0101(.a(y_input_26_layer_1_0101), .s(s[0]), .y(y_input_26_layer_2_010[1]));
            mux2 mux_input_26_layer2_010 (.a(y_input_26_layer_2_010), .s(s[1]), .y(y_input_26_layer_3_01[0]));
            logic [1:0] y_input_26_layer_2_011;
                logic [1:0] y_input_26_layer_1_0110;
                    always_comb y_input_26_layer_1_0110[0] = a2[410]; // wire
                    always_comb y_input_26_layer_1_0110[1] = a2[442]; // wire
                mux2 mux_input_26_layer1_0110(.a(y_input_26_layer_1_0110), .s(s[0]), .y(y_input_26_layer_2_011[0]));
                logic [1:0] y_input_26_layer_1_0111;
                    always_comb y_input_26_layer_1_0111[0] = a2[474]; // wire
                    always_comb y_input_26_layer_1_0111[1] = a2[506]; // wire
                mux2 mux_input_26_layer1_0111(.a(y_input_26_layer_1_0111), .s(s[0]), .y(y_input_26_layer_2_011[1]));
            mux2 mux_input_26_layer2_011 (.a(y_input_26_layer_2_011), .s(s[1]), .y(y_input_26_layer_3_01[1]));
        mux2 mux_input_26_layer3_01  (.a(y_input_26_layer_3_01), .s(s[2]), .y(y_input_26_layer_4_0[1]));
    mux2 mux_input_26_layer4_0   (.a(y_input_26_layer_4_0), .s(s[3]), .y(y[26]));
            
            ////////////////////////   INPUT WIRE 27   ////////////////////////
            
    logic [1:0] y_input_27_layer_4_0;
        logic [1:0] y_input_27_layer_3_00;
            logic [1:0] y_input_27_layer_2_000;
                logic [1:0] y_input_27_layer_1_0000;
                    always_comb y_input_27_layer_1_0000[0] = a2[27]; // wire
                    always_comb y_input_27_layer_1_0000[1] = a2[59]; // wire
                mux2 mux_input_27_layer1_0000(.a(y_input_27_layer_1_0000), .s(s[0]), .y(y_input_27_layer_2_000[0]));
                logic [1:0] y_input_27_layer_1_0001;
                    always_comb y_input_27_layer_1_0001[0] = a2[91]; // wire
                    always_comb y_input_27_layer_1_0001[1] = a2[123]; // wire
                mux2 mux_input_27_layer1_0001(.a(y_input_27_layer_1_0001), .s(s[0]), .y(y_input_27_layer_2_000[1]));
            mux2 mux_input_27_layer2_000 (.a(y_input_27_layer_2_000), .s(s[1]), .y(y_input_27_layer_3_00[0]));
            logic [1:0] y_input_27_layer_2_001;
                logic [1:0] y_input_27_layer_1_0010;
                    always_comb y_input_27_layer_1_0010[0] = a2[155]; // wire
                    always_comb y_input_27_layer_1_0010[1] = a2[187]; // wire
                mux2 mux_input_27_layer1_0010(.a(y_input_27_layer_1_0010), .s(s[0]), .y(y_input_27_layer_2_001[0]));
                logic [1:0] y_input_27_layer_1_0011;
                    always_comb y_input_27_layer_1_0011[0] = a2[219]; // wire
                    always_comb y_input_27_layer_1_0011[1] = a2[251]; // wire
                mux2 mux_input_27_layer1_0011(.a(y_input_27_layer_1_0011), .s(s[0]), .y(y_input_27_layer_2_001[1]));
            mux2 mux_input_27_layer2_001 (.a(y_input_27_layer_2_001), .s(s[1]), .y(y_input_27_layer_3_00[1]));
        mux2 mux_input_27_layer3_00  (.a(y_input_27_layer_3_00), .s(s[2]), .y(y_input_27_layer_4_0[0]));
        logic [1:0] y_input_27_layer_3_01;
            logic [1:0] y_input_27_layer_2_010;
                logic [1:0] y_input_27_layer_1_0100;
                    always_comb y_input_27_layer_1_0100[0] = a2[283]; // wire
                    always_comb y_input_27_layer_1_0100[1] = a2[315]; // wire
                mux2 mux_input_27_layer1_0100(.a(y_input_27_layer_1_0100), .s(s[0]), .y(y_input_27_layer_2_010[0]));
                logic [1:0] y_input_27_layer_1_0101;
                    always_comb y_input_27_layer_1_0101[0] = a2[347]; // wire
                    always_comb y_input_27_layer_1_0101[1] = a2[379]; // wire
                mux2 mux_input_27_layer1_0101(.a(y_input_27_layer_1_0101), .s(s[0]), .y(y_input_27_layer_2_010[1]));
            mux2 mux_input_27_layer2_010 (.a(y_input_27_layer_2_010), .s(s[1]), .y(y_input_27_layer_3_01[0]));
            logic [1:0] y_input_27_layer_2_011;
                logic [1:0] y_input_27_layer_1_0110;
                    always_comb y_input_27_layer_1_0110[0] = a2[411]; // wire
                    always_comb y_input_27_layer_1_0110[1] = a2[443]; // wire
                mux2 mux_input_27_layer1_0110(.a(y_input_27_layer_1_0110), .s(s[0]), .y(y_input_27_layer_2_011[0]));
                logic [1:0] y_input_27_layer_1_0111;
                    always_comb y_input_27_layer_1_0111[0] = a2[475]; // wire
                    always_comb y_input_27_layer_1_0111[1] = a2[507]; // wire
                mux2 mux_input_27_layer1_0111(.a(y_input_27_layer_1_0111), .s(s[0]), .y(y_input_27_layer_2_011[1]));
            mux2 mux_input_27_layer2_011 (.a(y_input_27_layer_2_011), .s(s[1]), .y(y_input_27_layer_3_01[1]));
        mux2 mux_input_27_layer3_01  (.a(y_input_27_layer_3_01), .s(s[2]), .y(y_input_27_layer_4_0[1]));
    mux2 mux_input_27_layer4_0   (.a(y_input_27_layer_4_0), .s(s[3]), .y(y[27]));
            
            ////////////////////////   INPUT WIRE 28   ////////////////////////
            
    logic [1:0] y_input_28_layer_4_0;
        logic [1:0] y_input_28_layer_3_00;
            logic [1:0] y_input_28_layer_2_000;
                logic [1:0] y_input_28_layer_1_0000;
                    always_comb y_input_28_layer_1_0000[0] = a2[28]; // wire
                    always_comb y_input_28_layer_1_0000[1] = a2[60]; // wire
                mux2 mux_input_28_layer1_0000(.a(y_input_28_layer_1_0000), .s(s[0]), .y(y_input_28_layer_2_000[0]));
                logic [1:0] y_input_28_layer_1_0001;
                    always_comb y_input_28_layer_1_0001[0] = a2[92]; // wire
                    always_comb y_input_28_layer_1_0001[1] = a2[124]; // wire
                mux2 mux_input_28_layer1_0001(.a(y_input_28_layer_1_0001), .s(s[0]), .y(y_input_28_layer_2_000[1]));
            mux2 mux_input_28_layer2_000 (.a(y_input_28_layer_2_000), .s(s[1]), .y(y_input_28_layer_3_00[0]));
            logic [1:0] y_input_28_layer_2_001;
                logic [1:0] y_input_28_layer_1_0010;
                    always_comb y_input_28_layer_1_0010[0] = a2[156]; // wire
                    always_comb y_input_28_layer_1_0010[1] = a2[188]; // wire
                mux2 mux_input_28_layer1_0010(.a(y_input_28_layer_1_0010), .s(s[0]), .y(y_input_28_layer_2_001[0]));
                logic [1:0] y_input_28_layer_1_0011;
                    always_comb y_input_28_layer_1_0011[0] = a2[220]; // wire
                    always_comb y_input_28_layer_1_0011[1] = a2[252]; // wire
                mux2 mux_input_28_layer1_0011(.a(y_input_28_layer_1_0011), .s(s[0]), .y(y_input_28_layer_2_001[1]));
            mux2 mux_input_28_layer2_001 (.a(y_input_28_layer_2_001), .s(s[1]), .y(y_input_28_layer_3_00[1]));
        mux2 mux_input_28_layer3_00  (.a(y_input_28_layer_3_00), .s(s[2]), .y(y_input_28_layer_4_0[0]));
        logic [1:0] y_input_28_layer_3_01;
            logic [1:0] y_input_28_layer_2_010;
                logic [1:0] y_input_28_layer_1_0100;
                    always_comb y_input_28_layer_1_0100[0] = a2[284]; // wire
                    always_comb y_input_28_layer_1_0100[1] = a2[316]; // wire
                mux2 mux_input_28_layer1_0100(.a(y_input_28_layer_1_0100), .s(s[0]), .y(y_input_28_layer_2_010[0]));
                logic [1:0] y_input_28_layer_1_0101;
                    always_comb y_input_28_layer_1_0101[0] = a2[348]; // wire
                    always_comb y_input_28_layer_1_0101[1] = a2[380]; // wire
                mux2 mux_input_28_layer1_0101(.a(y_input_28_layer_1_0101), .s(s[0]), .y(y_input_28_layer_2_010[1]));
            mux2 mux_input_28_layer2_010 (.a(y_input_28_layer_2_010), .s(s[1]), .y(y_input_28_layer_3_01[0]));
            logic [1:0] y_input_28_layer_2_011;
                logic [1:0] y_input_28_layer_1_0110;
                    always_comb y_input_28_layer_1_0110[0] = a2[412]; // wire
                    always_comb y_input_28_layer_1_0110[1] = a2[444]; // wire
                mux2 mux_input_28_layer1_0110(.a(y_input_28_layer_1_0110), .s(s[0]), .y(y_input_28_layer_2_011[0]));
                logic [1:0] y_input_28_layer_1_0111;
                    always_comb y_input_28_layer_1_0111[0] = a2[476]; // wire
                    always_comb y_input_28_layer_1_0111[1] = a2[508]; // wire
                mux2 mux_input_28_layer1_0111(.a(y_input_28_layer_1_0111), .s(s[0]), .y(y_input_28_layer_2_011[1]));
            mux2 mux_input_28_layer2_011 (.a(y_input_28_layer_2_011), .s(s[1]), .y(y_input_28_layer_3_01[1]));
        mux2 mux_input_28_layer3_01  (.a(y_input_28_layer_3_01), .s(s[2]), .y(y_input_28_layer_4_0[1]));
    mux2 mux_input_28_layer4_0   (.a(y_input_28_layer_4_0), .s(s[3]), .y(y[28]));
            
            ////////////////////////   INPUT WIRE 29   ////////////////////////
            
    logic [1:0] y_input_29_layer_4_0;
        logic [1:0] y_input_29_layer_3_00;
            logic [1:0] y_input_29_layer_2_000;
                logic [1:0] y_input_29_layer_1_0000;
                    always_comb y_input_29_layer_1_0000[0] = a2[29]; // wire
                    always_comb y_input_29_layer_1_0000[1] = a2[61]; // wire
                mux2 mux_input_29_layer1_0000(.a(y_input_29_layer_1_0000), .s(s[0]), .y(y_input_29_layer_2_000[0]));
                logic [1:0] y_input_29_layer_1_0001;
                    always_comb y_input_29_layer_1_0001[0] = a2[93]; // wire
                    always_comb y_input_29_layer_1_0001[1] = a2[125]; // wire
                mux2 mux_input_29_layer1_0001(.a(y_input_29_layer_1_0001), .s(s[0]), .y(y_input_29_layer_2_000[1]));
            mux2 mux_input_29_layer2_000 (.a(y_input_29_layer_2_000), .s(s[1]), .y(y_input_29_layer_3_00[0]));
            logic [1:0] y_input_29_layer_2_001;
                logic [1:0] y_input_29_layer_1_0010;
                    always_comb y_input_29_layer_1_0010[0] = a2[157]; // wire
                    always_comb y_input_29_layer_1_0010[1] = a2[189]; // wire
                mux2 mux_input_29_layer1_0010(.a(y_input_29_layer_1_0010), .s(s[0]), .y(y_input_29_layer_2_001[0]));
                logic [1:0] y_input_29_layer_1_0011;
                    always_comb y_input_29_layer_1_0011[0] = a2[221]; // wire
                    always_comb y_input_29_layer_1_0011[1] = a2[253]; // wire
                mux2 mux_input_29_layer1_0011(.a(y_input_29_layer_1_0011), .s(s[0]), .y(y_input_29_layer_2_001[1]));
            mux2 mux_input_29_layer2_001 (.a(y_input_29_layer_2_001), .s(s[1]), .y(y_input_29_layer_3_00[1]));
        mux2 mux_input_29_layer3_00  (.a(y_input_29_layer_3_00), .s(s[2]), .y(y_input_29_layer_4_0[0]));
        logic [1:0] y_input_29_layer_3_01;
            logic [1:0] y_input_29_layer_2_010;
                logic [1:0] y_input_29_layer_1_0100;
                    always_comb y_input_29_layer_1_0100[0] = a2[285]; // wire
                    always_comb y_input_29_layer_1_0100[1] = a2[317]; // wire
                mux2 mux_input_29_layer1_0100(.a(y_input_29_layer_1_0100), .s(s[0]), .y(y_input_29_layer_2_010[0]));
                logic [1:0] y_input_29_layer_1_0101;
                    always_comb y_input_29_layer_1_0101[0] = a2[349]; // wire
                    always_comb y_input_29_layer_1_0101[1] = a2[381]; // wire
                mux2 mux_input_29_layer1_0101(.a(y_input_29_layer_1_0101), .s(s[0]), .y(y_input_29_layer_2_010[1]));
            mux2 mux_input_29_layer2_010 (.a(y_input_29_layer_2_010), .s(s[1]), .y(y_input_29_layer_3_01[0]));
            logic [1:0] y_input_29_layer_2_011;
                logic [1:0] y_input_29_layer_1_0110;
                    always_comb y_input_29_layer_1_0110[0] = a2[413]; // wire
                    always_comb y_input_29_layer_1_0110[1] = a2[445]; // wire
                mux2 mux_input_29_layer1_0110(.a(y_input_29_layer_1_0110), .s(s[0]), .y(y_input_29_layer_2_011[0]));
                logic [1:0] y_input_29_layer_1_0111;
                    always_comb y_input_29_layer_1_0111[0] = a2[477]; // wire
                    always_comb y_input_29_layer_1_0111[1] = a2[509]; // wire
                mux2 mux_input_29_layer1_0111(.a(y_input_29_layer_1_0111), .s(s[0]), .y(y_input_29_layer_2_011[1]));
            mux2 mux_input_29_layer2_011 (.a(y_input_29_layer_2_011), .s(s[1]), .y(y_input_29_layer_3_01[1]));
        mux2 mux_input_29_layer3_01  (.a(y_input_29_layer_3_01), .s(s[2]), .y(y_input_29_layer_4_0[1]));
    mux2 mux_input_29_layer4_0   (.a(y_input_29_layer_4_0), .s(s[3]), .y(y[29]));
            
            ////////////////////////   INPUT WIRE 30   ////////////////////////
            
    logic [1:0] y_input_30_layer_4_0;
        logic [1:0] y_input_30_layer_3_00;
            logic [1:0] y_input_30_layer_2_000;
                logic [1:0] y_input_30_layer_1_0000;
                    always_comb y_input_30_layer_1_0000[0] = a2[30]; // wire
                    always_comb y_input_30_layer_1_0000[1] = a2[62]; // wire
                mux2 mux_input_30_layer1_0000(.a(y_input_30_layer_1_0000), .s(s[0]), .y(y_input_30_layer_2_000[0]));
                logic [1:0] y_input_30_layer_1_0001;
                    always_comb y_input_30_layer_1_0001[0] = a2[94]; // wire
                    always_comb y_input_30_layer_1_0001[1] = a2[126]; // wire
                mux2 mux_input_30_layer1_0001(.a(y_input_30_layer_1_0001), .s(s[0]), .y(y_input_30_layer_2_000[1]));
            mux2 mux_input_30_layer2_000 (.a(y_input_30_layer_2_000), .s(s[1]), .y(y_input_30_layer_3_00[0]));
            logic [1:0] y_input_30_layer_2_001;
                logic [1:0] y_input_30_layer_1_0010;
                    always_comb y_input_30_layer_1_0010[0] = a2[158]; // wire
                    always_comb y_input_30_layer_1_0010[1] = a2[190]; // wire
                mux2 mux_input_30_layer1_0010(.a(y_input_30_layer_1_0010), .s(s[0]), .y(y_input_30_layer_2_001[0]));
                logic [1:0] y_input_30_layer_1_0011;
                    always_comb y_input_30_layer_1_0011[0] = a2[222]; // wire
                    always_comb y_input_30_layer_1_0011[1] = a2[254]; // wire
                mux2 mux_input_30_layer1_0011(.a(y_input_30_layer_1_0011), .s(s[0]), .y(y_input_30_layer_2_001[1]));
            mux2 mux_input_30_layer2_001 (.a(y_input_30_layer_2_001), .s(s[1]), .y(y_input_30_layer_3_00[1]));
        mux2 mux_input_30_layer3_00  (.a(y_input_30_layer_3_00), .s(s[2]), .y(y_input_30_layer_4_0[0]));
        logic [1:0] y_input_30_layer_3_01;
            logic [1:0] y_input_30_layer_2_010;
                logic [1:0] y_input_30_layer_1_0100;
                    always_comb y_input_30_layer_1_0100[0] = a2[286]; // wire
                    always_comb y_input_30_layer_1_0100[1] = a2[318]; // wire
                mux2 mux_input_30_layer1_0100(.a(y_input_30_layer_1_0100), .s(s[0]), .y(y_input_30_layer_2_010[0]));
                logic [1:0] y_input_30_layer_1_0101;
                    always_comb y_input_30_layer_1_0101[0] = a2[350]; // wire
                    always_comb y_input_30_layer_1_0101[1] = a2[382]; // wire
                mux2 mux_input_30_layer1_0101(.a(y_input_30_layer_1_0101), .s(s[0]), .y(y_input_30_layer_2_010[1]));
            mux2 mux_input_30_layer2_010 (.a(y_input_30_layer_2_010), .s(s[1]), .y(y_input_30_layer_3_01[0]));
            logic [1:0] y_input_30_layer_2_011;
                logic [1:0] y_input_30_layer_1_0110;
                    always_comb y_input_30_layer_1_0110[0] = a2[414]; // wire
                    always_comb y_input_30_layer_1_0110[1] = a2[446]; // wire
                mux2 mux_input_30_layer1_0110(.a(y_input_30_layer_1_0110), .s(s[0]), .y(y_input_30_layer_2_011[0]));
                logic [1:0] y_input_30_layer_1_0111;
                    always_comb y_input_30_layer_1_0111[0] = a2[478]; // wire
                    always_comb y_input_30_layer_1_0111[1] = a2[510]; // wire
                mux2 mux_input_30_layer1_0111(.a(y_input_30_layer_1_0111), .s(s[0]), .y(y_input_30_layer_2_011[1]));
            mux2 mux_input_30_layer2_011 (.a(y_input_30_layer_2_011), .s(s[1]), .y(y_input_30_layer_3_01[1]));
        mux2 mux_input_30_layer3_01  (.a(y_input_30_layer_3_01), .s(s[2]), .y(y_input_30_layer_4_0[1]));
    mux2 mux_input_30_layer4_0   (.a(y_input_30_layer_4_0), .s(s[3]), .y(y[30]));
            
            ////////////////////////   INPUT WIRE 31   ////////////////////////
            
    logic [1:0] y_input_31_layer_4_0;
        logic [1:0] y_input_31_layer_3_00;
            logic [1:0] y_input_31_layer_2_000;
                logic [1:0] y_input_31_layer_1_0000;
                    always_comb y_input_31_layer_1_0000[0] = a2[31]; // wire
                    always_comb y_input_31_layer_1_0000[1] = a2[63]; // wire
                mux2 mux_input_31_layer1_0000(.a(y_input_31_layer_1_0000), .s(s[0]), .y(y_input_31_layer_2_000[0]));
                logic [1:0] y_input_31_layer_1_0001;
                    always_comb y_input_31_layer_1_0001[0] = a2[95]; // wire
                    always_comb y_input_31_layer_1_0001[1] = a2[127]; // wire
                mux2 mux_input_31_layer1_0001(.a(y_input_31_layer_1_0001), .s(s[0]), .y(y_input_31_layer_2_000[1]));
            mux2 mux_input_31_layer2_000 (.a(y_input_31_layer_2_000), .s(s[1]), .y(y_input_31_layer_3_00[0]));
            logic [1:0] y_input_31_layer_2_001;
                logic [1:0] y_input_31_layer_1_0010;
                    always_comb y_input_31_layer_1_0010[0] = a2[159]; // wire
                    always_comb y_input_31_layer_1_0010[1] = a2[191]; // wire
                mux2 mux_input_31_layer1_0010(.a(y_input_31_layer_1_0010), .s(s[0]), .y(y_input_31_layer_2_001[0]));
                logic [1:0] y_input_31_layer_1_0011;
                    always_comb y_input_31_layer_1_0011[0] = a2[223]; // wire
                    always_comb y_input_31_layer_1_0011[1] = a2[255]; // wire
                mux2 mux_input_31_layer1_0011(.a(y_input_31_layer_1_0011), .s(s[0]), .y(y_input_31_layer_2_001[1]));
            mux2 mux_input_31_layer2_001 (.a(y_input_31_layer_2_001), .s(s[1]), .y(y_input_31_layer_3_00[1]));
        mux2 mux_input_31_layer3_00  (.a(y_input_31_layer_3_00), .s(s[2]), .y(y_input_31_layer_4_0[0]));
        logic [1:0] y_input_31_layer_3_01;
            logic [1:0] y_input_31_layer_2_010;
                logic [1:0] y_input_31_layer_1_0100;
                    always_comb y_input_31_layer_1_0100[0] = a2[287]; // wire
                    always_comb y_input_31_layer_1_0100[1] = a2[319]; // wire
                mux2 mux_input_31_layer1_0100(.a(y_input_31_layer_1_0100), .s(s[0]), .y(y_input_31_layer_2_010[0]));
                logic [1:0] y_input_31_layer_1_0101;
                    always_comb y_input_31_layer_1_0101[0] = a2[351]; // wire
                    always_comb y_input_31_layer_1_0101[1] = a2[383]; // wire
                mux2 mux_input_31_layer1_0101(.a(y_input_31_layer_1_0101), .s(s[0]), .y(y_input_31_layer_2_010[1]));
            mux2 mux_input_31_layer2_010 (.a(y_input_31_layer_2_010), .s(s[1]), .y(y_input_31_layer_3_01[0]));
            logic [1:0] y_input_31_layer_2_011;
                logic [1:0] y_input_31_layer_1_0110;
                    always_comb y_input_31_layer_1_0110[0] = a2[415]; // wire
                    always_comb y_input_31_layer_1_0110[1] = a2[447]; // wire
                mux2 mux_input_31_layer1_0110(.a(y_input_31_layer_1_0110), .s(s[0]), .y(y_input_31_layer_2_011[0]));
                logic [1:0] y_input_31_layer_1_0111;
                    always_comb y_input_31_layer_1_0111[0] = a2[479]; // wire
                    always_comb y_input_31_layer_1_0111[1] = a2[511]; // wire
                mux2 mux_input_31_layer1_0111(.a(y_input_31_layer_1_0111), .s(s[0]), .y(y_input_31_layer_2_011[1]));
            mux2 mux_input_31_layer2_011 (.a(y_input_31_layer_2_011), .s(s[1]), .y(y_input_31_layer_3_01[1]));
        mux2 mux_input_31_layer3_01  (.a(y_input_31_layer_3_01), .s(s[2]), .y(y_input_31_layer_4_0[1]));
    mux2 mux_input_31_layer4_0   (.a(y_input_31_layer_4_0), .s(s[3]), .y(y[31]));
    
endmodule
