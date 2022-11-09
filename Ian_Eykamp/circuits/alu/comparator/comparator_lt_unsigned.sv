`include "./hdl/adder_n.sv"

module comparator_lt_unsigned(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;

// Using only *structural* combinational logic, make a module that computes if a is less than b!
// Note: this assumes that the two inputs are signed: aka should be interpreted as two's complement.

logic signed [N-1:0] diff;
logic carry_out;
adder_n #(.N(N)) subtractor_from_2N(.a(a), .b(~b), .c_in(1'b1), .sum(diff), .c_out(carry_out));
// computes A + (2^N - B) = 2^N + (A - B)
// if A > B, there is a carry out
// if A == B, there is a carry out (2^N carries out)
// if A < B, there is no carry out
always_comb out = ~carry_out;

// Copy any other modules you use into the HDL folder and update the Makefile accordingly.

endmodule


