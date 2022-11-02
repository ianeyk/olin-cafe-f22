/*
  Outputs a pulse generator with a period of "ticks".
  out should go high for one cycle ever "ticks" clocks.
*/
module pulse_generator(clk, rst, ena, ticks, out);

parameter N = 8;
input wire clk, rst, ena;
input wire [N-1:0] ticks;
input wire [N-1:0] ticks_minus_one;
output logic out;

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
