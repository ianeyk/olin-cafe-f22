`include "./adder_n/generated_adders/adder32.sv"

module comparator_lt(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;

// Using only *structural* combinational logic, make a module that computes if a is less than b!
// Note: this assumes that the two inputs are signed: aka should be interpreted as two's complement.

logic sign_a;
logic sign_b;
logic a_loses_on_sign;
logic b_loses_on_sign;

always_comb sign_a = a[N-1];
always_comb sign_b = b[N-1];
always_comb a_loses_on_sign = sign_a & ~sign_b;
always_comb b_loses_on_sign = ~sign_a & sign_b;

logic signed [N-1:0] diff;
logic carry_out;
adder32 subtractor(.a(a), .b(~b), .cin(1'b1), .s(diff), .cout(carry_out));

logic diff_sign;
always_comb diff_sign = diff[N-1];

// if a loses based on sign, this yields 1 and overrides the result of the OR gate
// if b loses based on sign, this yields 0 and overrides the result of the AND gate
// a and b can never lose based on sign at the same time
// if neither a nor b loses on sign, then the result is determined by diff_sign.
always_comb out = (a_loses_on_sign | diff_sign) & ~b_loses_on_sign;

// always @(a, b) begin
//     $display("diff = %b", diff);
//     $display("a_loses_on_diff_sign = %b", a_loses_on_sign);
//     $display("b_loses_on_diff_sign = %b", b_loses_on_sign);
// end

// Copy any other modules you use into the HDL folder and update the Makefile accordingly.

endmodule


