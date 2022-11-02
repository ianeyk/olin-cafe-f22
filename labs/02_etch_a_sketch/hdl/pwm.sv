/*
  A pulse width modulation module 
*/

module pwm(clk, rst, ena, step, duty, out);

parameter N = 8;

input wire clk, rst;
input wire ena; // Enables the output.
input wire step; // Enables the internal counter. You should only increment when this signal is high (this is how we slow down the PWM to reasonable speeds).
input wire [N-1:0] duty; // The "duty cycle" input.
output logic out;

logic [N-1:0] counter;

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

logic counter_comparator;
always_comb out = counter_comparator;

logic [1:0] dead_end;
adder_n #(.N(N)) decrementer(.a(counter), .b({N{1'b1}}), .c_in(1'b0), .sum(next_counter), .c_out(dead_end[0]));
// comparator_eq ticks_reached(.a(counter), .b({N{1'b0}}), .out(counter_comparator));
always_comb counter_comparator = ~(|counter); // == 0;

adder_n #(.N(N)) ticks_reset_value(.a(ticks), .b({N{1'b1}}), .c_in(1'b0), .sum(ticks_minus_one), .c_out(dead_end[1]));

always_ff @(posedge(clk)) begin
  if (rst) begin
    counter <= ticks;
  end else begin
    if (ena) begin
      if (counter_comparator) begin
        counter <= ticks_minus_one;
      end else begin
        counter <= next_counter;
      end
    end else begin
      counter <= counter;
    end
  end
end

endmodule
