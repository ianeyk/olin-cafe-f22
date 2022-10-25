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
logic [N-1:0] next_counter;
logic ticks_reached;

logic [N-1:0] counter_will_be;
logic trash_can;

adder_n #(.N(N)) incrementer(.a(counter), .b({N{1'b0}}), .c_in(1'b1), .sum(next_counter), .c_out(trash_can));
comparator_eq #(.N(N)) tick_threshold(.a(ticks), .b(counter), .out(ticks_reached));

always_comb counter_will_be = next_counter | {N{ticks_reached}} | {N{rst}};
// whenever the ticks_threshold is met or RST is asserted, reset the counter to 111111 on the next tick, 
// such that next_counter = 000000

// always_comb counter_will_be = next_counter & {N{~ticks_reached}} & {N{~rst}};
// whenever the ticks_threshold is met or RST is asserted, reset the counter to 000000 on the next tick, 
// such that next_counter = 000001

always_comb out = ticks_reached & ena;
// only output if ENA is also enabled

always_ff @(posedge(clk)) begin
  // $display("ticks = %b, counter: %b, ticks_reached: %b", ticks, counter, ticks_reached);
  counter <= counter_will_be;
  // let the next_counter value flow through
end


endmodule
