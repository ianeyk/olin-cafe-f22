// Generates "triangle" waves (counts from 0 to 2^N-1, then back down again)
// The triangle should increment/decrement only if the ena signal is high, and hold its value otherwise.
module triangle_generator(clk, rst, ena, out);

parameter N = 8;
parameter N_MINUS_1 = (N - 1);

input wire clk, rst, ena;
output logic [N-1:0] out;

// typedef enum logic {COUNTING_UP, COUNTING_DOWN} state_t; // enums don't work in AND gates
// state_t state;
// state_t next_state;

logic state;
logic next_state;

// a better way to write this would probably be with a ternary statement
// always_comb add_or_subtract_num = state ? {{N_MINUS_1{1'b0}}, 1'b1} : {N{1'b1}}
mux2 add_or_subtract(.a(2'b10), .s(state), .y(add_or_subtract_bit));
logic add_or_subtract_bit;
logic [N-1:0] add_or_subtract_num;
always_comb add_or_subtract_num = {{N_MINUS_1{add_or_subtract_bit}}, 1'b1};
// always add either ...0001 (counting up) or ...1111 (counting down)

mux2 set_counter_threshold(.a(2'b01), .s(state), .y(counter_threshold_bit));
logic counter_threshold_bit;
logic [N-1:0] counter_threshold;
always_comb counter_threshold = {{N_MINUS_1{counter_threshold_bit}}, ~counter_threshold_bit};
// the counter overshoots by one, so tell it to stop at ...0001 and at ...1110

logic [N-1:0] counter;
logic [N-1:0] next_counter;
logic ticks_reached;

logic [N-1:0] counter_will_be;
logic trash_can;

adder_n #(.N(N)) incrementer(.a(counter), .b(add_or_subtract_num), .c_in(1'b0), .sum(next_counter), .c_out(trash_can));
comparator_eq #(.N(N)) tick_threshold(.a(counter), .b(counter_threshold), .out(ticks_reached));

always_comb counter_will_be = next_counter | {N{rst}};
// whenever the ticks_threshold is met or RST is asserted, reset the counter to 111111 on the next tick, 
// such that next_counter = 000000

always_comb next_state = (state ^ ticks_reached) & ~rst; // toggles state when ticks_reached goes temporarily high

always_comb out = counter & {N{ena}};

always_ff @(posedge(clk)) begin
  $display("counter: %b, ticks_reached: %b, next_state = %b", counter, ticks_reached, next_state);
  counter <= counter_will_be;
  // let the next_counter value flow through
  state <= next_state;
end


endmodule