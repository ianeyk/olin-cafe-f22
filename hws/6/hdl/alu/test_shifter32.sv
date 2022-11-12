`timescale 1ns/1ps
`default_nettype none
`include "./generated_shifters/shifter_ll32.sv"
`include "./generated_shifters/shifter_rl32.sv"
`include "./generated_shifters/shifter_ra32.sv"

module test_shifter32;

    int errors = 0;

    logic [31:0] a;
    logic [4:0] s;
    wire [31:0] y_ll;
    wire [31:0] y_rl;
    wire [31:0] y_ra;

    shifter_ll32 UUT_ll(.a(a), .s(s), .y(y_ll));
    shifter_rl32 UUT_rl(.a(a), .s(s), .y(y_rl));
    shifter_ra32 UUT_ra(.a(a), .s(s), .y(y_ra));


    // Some behavioural comb. logic that computes correct values.
    logic [31:0] correct_out_ll;
    logic [31:0] correct_out_rl;
    logic [31:0] correct_out_ra;

    always_comb begin : behavioural_solution_logic
        correct_out_ll = a << s;
        correct_out_rl = a >> s;
        correct_out_ra = a >>> s;
    end

    // You can make "tasks" in testbenches. Think of them like methods of a class, 
    // they have access to the member variables.
    task print_io;
        $display("%b %b | %b (%b), %b (%b), %b (%b)", s, a, y_ll, correct_out_ll, y_rl, correct_out_rl, y_ra, correct_out_ra);
    endtask

    time i; // 64-bit integer, not 32
    // 2) the test cases - initial blocks are like programming, not hardware
    initial begin
    $dumpfile("././generated_shifters/shifter32.fst");
    $dumpvars(0, UUT_ll);
    $dumpvars(0, UUT_rl);
    $dumpvars(0, UUT_ra);
    
    $display("Checking all inputs.");
$display("s     a                                | y (correct out)");
    for (i = 0; i < 1024; i = i + 1) begin
        a[31:0] = $random;

        s[4:0] = $random;

        #1 print_io();
    end
    
    if (errors !== 0) begin
        $display("---------------------------------------------------------------");
        $display("-- FAILURE                                                   --");
        $display("---------------------------------------------------------------");
        $display(" %d failures found, try again!", errors);
    end else begin
        $display("---------------------------------------------------------------");
        $display("-- SUCCESS                                                   --");
        $display("---------------------------------------------------------------");
    end
    $finish;
    end

    // Note: the triple === (corresponding !==) check 4-state (e.g. 0,1,x,z) values.
    //       It's best practice to use these for checkers!
    always @(a or s) begin
        assert(y_ll === correct_out_ll & y_rl === correct_out_rl & y_ra === correct_out_ra) else begin
            // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
            errors = errors + 1;
        end
    end

endmodule
