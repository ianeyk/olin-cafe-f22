`timescale 1ns/1ps
`default_nettype none
`include "./mux2.sv"

module mux_n #(parameter n = 2) (a, s, y);
    // must give n >= 2

    input [n-1:0] a; // length n, which may or may not be a multiple of 2
    input [$clog2(n)-1:0] s;
    output logic y; // the last or logic

    // Below is "STRUCTURAL" verilog - explicit hardware
    
    
    // temporary variables, only used for synthesis, not actual logic wires in hardware
    `define ns ($clog2(n)) /* number of bits in the select bus (clog2 rounds up)*/
    `define n2 (`ns ** 2) /* rounds n up to the nearest multiple of two*/
    `define n1 (`n2 / 2)  /* one half of n2*/
    `define ndiff = (`n2 - n)
    
    logic [`n2-1:0] a2; // length n2
  
    always_comb a2 = {{ndiff{1'b0}}, a};

    always @* $display("n = %b", n);
    always @* $display("ns = %b", `ns);
    always @* $display("n2 = %b", `n2);
    always @* $display("n1 = %b", `n1);
    
    generate
      logic [1:0] y_0;
      if (n == 1) begin // trivial solution; it's a wire
        always_comb y = a[0];
        always_comb y_0 = 2`b0;
      end else begin
        mux_n #(.n(`n1)) mux_0(.a(a2[`n1-1:0]), .s(s[`ns-2:0]), .y(y_0[0]));
        mux_n #(.n(`n1)) mux_1(.a(a2[`n2-1:`n1]),  .s(s[`ns-2:0]), .y(y_0[1]));
        mux2 mux(.a(y_0), .s(s[`ns-1]), .y(y)); // combine the above two muxes together
      end
    endgenerate

endmodule