module debouncer(clk, rst, bouncy_in, debounced_out);

parameter BOUNCE_TICKS = 10;
input wire clk, rst;
input wire bouncy_in;

output logic debounced_out;

enum logic [1:0] {
  S_0 = 2'b00,
  S_MAYBE_1 = 2'b01,
  S_1 = 2'b10,
  S_MAYBE_0 = 2'b11
} state;

//clog2 = ceiling(log_base_2(x)) - how many bits do I need
logic [$clog2(BOUNCE_TICKS):0] counter;

always @(posedge(clk)) begin
  if (rst == 0) begin
    state <= S_0;
    counter <= 0;
  end else begin
    case(state)
      S_0: begin
        if (bouncy_in)
          state <= S_MAYBE_1;
          counter <= 0;
      end
      S_MAYBE_1: begin
        if (counter >= BOUNCE_TICKS) begin
          if (bouncy_in) begin
            state <= S_1;
            counter <= 0;
          end else begin
            state <= S_0;
            counter <= 0;
          end
        end else begin
          counter <= counter + 1;
        end
      end
      S_1: begin
        if (~bouncy_in)
          state <= S_MAYBE_0;
          counter <= 0;
      end
      S_MAYBE_0: begin
        if (counter >= BOUNCE_TICKS) begin
          if (bouncy_in) begin
            state <= S_1;
            counter <= 0;
          end else begin
            state <= S_0;
            counter <= 0;
          end
        end else begin
          counter <= counter + 1;
        end
      end
      default: begin
        $display("DEFAULT CASE REACHED. Check for errors.");
      end
    endcase
  end
end

endmodule