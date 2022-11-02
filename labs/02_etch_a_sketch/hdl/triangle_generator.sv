`ifndef INCLUDE_TRIANGLE_GENERATOR
`define INCLUDE_TRIANGLE_GENERATOR
`include "./hdl/adder_n.sv"

// Generates "triangle" waves (counts from 0 to 2^N-1, then back down again)
// The triangle should increment/decrement only if the ena signal is high, and hold its value otherwise.
module triangle_generator(clk, rst, ena, out);

parameter N = 8;
input wire clk, rst, ena;
output logic [N-1:0] out;

typedef enum logic {COUNTING_UP, COUNTING_DOWN} state_t;
state_t state;

logic [N-1:0] counter;
logic [N-1:0] next_counter;
logic counter_comparator;

logic [N-1:0] ticks; // const
logic [N-1:0] ticks_minus_one;
always_comb ticks = {N{1'b1}};
adder_n #(.N(N)) ticks_reset_value(.a(ticks), .b({N{1'b1}}), .c_in(1'b0), .sum(ticks_minus_one), .c_out(dead_end[1]));

// counter

logic [2:0] dead_end;
adder_n #(.N(N)) decrementer(.a(counter), .b({N{1'b1}}), .c_in(1'b0), .sum(next_counter), .c_out(dead_end[0]));
always_comb counter_comparator = ~(|counter); // == 0;

logic [N-1:0] up_counter; // 2^N - counter
always_comb up_counter = ~counter;
// adder_n #(.N(N)) counter_flipper(.a(~counter), .b({N{1'b0}}), .c_in(1'b0), .sum(up_counter), .c_out(dead_end[2]));

always_comb begin
    case (state)
    COUNTING_DOWN: begin
        out = counter;
    end
    COUNTING_UP: begin
        out = up_counter;
    end
    endcase
end

always_ff @(posedge(clk)) begin
  if (rst) begin
    state <= COUNTING_DOWN;
    counter <= ticks_minus_one;
  end else begin
    if (ena) begin
      if (counter_comparator) begin
        counter <= ticks_minus_one;
        
        case(state) // state <= ~state;
            COUNTING_DOWN: state <= COUNTING_UP;
            COUNTING_UP: state <= COUNTING_DOWN;
        endcase
        
      end else begin
        counter <= next_counter;
        state <= state;
      end
    end else begin
      counter <= counter;
    end
  end
end

endmodule

`endif