/*
  Outputs a pulse generator with a period of "ticks".
  out should go high for one cycle ever "ticks" clocks.
*/
module pulse_generator(clk, rst, ena, ticks, out);

parameter N = 8;
input wire clk, rst, ena;
input wire [N-1:0] ticks;
output logic out;

logic [N-1:0] counter;
logic ticks_less_than_counter;

logic [N-1:0] counter_will_be;
logic trash_can;

adder_n #(.N(N)) incrementer(.a(counter), .b({N{1'b0}}), .c_in(1'b1), .sum(counter_will_be), .c_out(trash_can));
comparator_lt #(.N(N)) tick_threshold(.a(ticks), .b(counter), .out(ticks_less_than_counter));

// always_ff(@posedge(clk)) begin
//   counter <= counter_will_be | {N{ticks_less_than_counter}};
// end


endmodule
