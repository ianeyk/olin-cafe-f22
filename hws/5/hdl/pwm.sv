/*
  A pulse width modulation module 
*/

module pwm(clk, rst, ena, step, duty, out);

parameter N = 8;
parameter N_MINUS_1 = (N - 1);
parameter N_MINUS_2 = (N - 2);

input wire clk, rst;
input wire ena; // Enables the output.
input wire step; // Enables the internal counter. You should only increment when this signal is high (this is how we slow down the PWM to reasonable speeds).
input wire [N-1:0] duty; // The "duty cycle" input.
output logic out;

// Create combinational (always_comb) and sequential (always_ff @(posedge clk)) 
// logic that drives the out signal.
// out should be off if ena is low.
// out should be fully zero (no pulses) if duty is 0.
// out should have its highest duty cycle if duty is 2^N-1;
// bonus: out should be fully zero at duty = 0, and fully 1 (always on) at duty = 2^N-1;
// You can use behavioural combinational logic, but try to keep your sequential
//   and combinational blocks as separate as possible.


logic [N-1:0] counter;
logic [N-1:0] next_counter;
logic [N-1:0] ticks;
logic ticks_reached;

// always_comb ticks = {{N_MINUS_2{1'b1}}, 2'b01};
always_comb ticks = {{N_MINUS_1{1'b1}}, 1'b0};

logic [N-1:0] counter_will_be;
logic counter_overflow;

adder_n #(.N(N)) incrementer(.a(counter), .b({N{1'b0}}), .c_in(1'b1), .sum(next_counter), .c_out(counter_overflow));
comparator_eq #(.N(N)) tick_threshold(.a(ticks), .b(counter), .out(ticks_reached));

// always_comb counter_will_be = next_counter | {N{ticks_reached}} | {N{rst}};
always_comb counter_will_be = next_counter & {N{~ticks_reached}} & {N{~rst}};
// whenever the ticks_threshold is met or RST is asserted, reset the counter to 111111 on the next tick, 
// such that next_counter = 000000

logic less_than_duty;
logic equal_to_duty;

comparator_lt_unsigned #(.N(N)) duty_control(.a(counter), .b(duty), .out(less_than_duty));
comparator_eq #(.N(N))         duty_equality(.a(counter), .b(duty), .out(equal_to_duty));

// always_comb out = (less_than_duty | equal_to_duty) & ena;
always_comb out = less_than_duty & ena;

always_ff @(posedge(clk)) begin
  
  // N-bit to N-bit two-way MUX
  if (step) begin
    counter <= counter_will_be;
  end else begin
    counter <= counter | {N{rst}};
  end
  // let the next_counter value flow through
end


endmodule
