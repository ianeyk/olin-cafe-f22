module comparator_eq(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;

// Using only *structural* combinational logic, make a module that computes if a == b. 
logic signed [N-1:0] bitwise_xor;
always_comb bitwise_xor = a ^ b; // 0 1 1 0
logic signed [N-1:0] bitwise_xnor;
always_comb bitwise_xnor = ~bitwise_xor; // 1 0 0 1

always_comb out = &(bitwise_xnor);

// Copy any other modules you use into the HDL folder and update the Makefile accordingly.

endmodule


