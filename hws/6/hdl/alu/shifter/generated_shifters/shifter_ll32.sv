`timescale 1ns/1ps
`default_nettype none
`include "./shifter/generated_muxes/mux32.sv"

module shifter_ll32(a, s, y);

    input [31:0] a;
    input [4:0] s;
    output logic [31:0] y;

    mux32 shifter_bit_0(.a({{31{1'b0}}, a[0]}), .s(s), .y(y[0]));
    mux32 shifter_bit_1(.a({{30{1'b0}}, a[0], a[1]}), .s(s), .y(y[1]));
    mux32 shifter_bit_2(.a({{29{1'b0}}, a[0], a[1], a[2]}), .s(s), .y(y[2]));
    mux32 shifter_bit_3(.a({{28{1'b0}}, a[0], a[1], a[2], a[3]}), .s(s), .y(y[3]));
    mux32 shifter_bit_4(.a({{27{1'b0}}, a[0], a[1], a[2], a[3], a[4]}), .s(s), .y(y[4]));
    mux32 shifter_bit_5(.a({{26{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5]}), .s(s), .y(y[5]));
    mux32 shifter_bit_6(.a({{25{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6]}), .s(s), .y(y[6]));
    mux32 shifter_bit_7(.a({{24{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]}), .s(s), .y(y[7]));
    mux32 shifter_bit_8(.a({{23{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]}), .s(s), .y(y[8]));
    mux32 shifter_bit_9(.a({{22{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]}), .s(s), .y(y[9]));
    mux32 shifter_bit_10(.a({{21{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]}), .s(s), .y(y[10]));
    mux32 shifter_bit_11(.a({{20{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]}), .s(s), .y(y[11]));
    mux32 shifter_bit_12(.a({{19{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]}), .s(s), .y(y[12]));
    mux32 shifter_bit_13(.a({{18{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]}), .s(s), .y(y[13]));
    mux32 shifter_bit_14(.a({{17{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]}), .s(s), .y(y[14]));
    mux32 shifter_bit_15(.a({{16{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15]}), .s(s), .y(y[15]));
    mux32 shifter_bit_16(.a({{15{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16]}), .s(s), .y(y[16]));
    mux32 shifter_bit_17(.a({{14{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17]}), .s(s), .y(y[17]));
    mux32 shifter_bit_18(.a({{13{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18]}), .s(s), .y(y[18]));
    mux32 shifter_bit_19(.a({{12{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19]}), .s(s), .y(y[19]));
    mux32 shifter_bit_20(.a({{11{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20]}), .s(s), .y(y[20]));
    mux32 shifter_bit_21(.a({{10{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21]}), .s(s), .y(y[21]));
    mux32 shifter_bit_22(.a({{9{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22]}), .s(s), .y(y[22]));
    mux32 shifter_bit_23(.a({{8{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23]}), .s(s), .y(y[23]));
    mux32 shifter_bit_24(.a({{7{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24]}), .s(s), .y(y[24]));
    mux32 shifter_bit_25(.a({{6{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25]}), .s(s), .y(y[25]));
    mux32 shifter_bit_26(.a({{5{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26]}), .s(s), .y(y[26]));
    mux32 shifter_bit_27(.a({{4{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27]}), .s(s), .y(y[27]));
    mux32 shifter_bit_28(.a({{3{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28]}), .s(s), .y(y[28]));
    mux32 shifter_bit_29(.a({{2{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29]}), .s(s), .y(y[29]));
    mux32 shifter_bit_30(.a({{1{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29], a[30]}), .s(s), .y(y[30]));
    mux32 shifter_bit_31(.a({{0{1'b0}}, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15], a[16], a[17], a[18], a[19], a[20], a[21], a[22], a[23], a[24], a[25], a[26], a[27], a[28], a[29], a[30], a[31]}), .s(s), .y(y[31]));

endmodule