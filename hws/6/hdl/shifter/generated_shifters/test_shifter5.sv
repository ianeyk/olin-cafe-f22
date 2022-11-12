`timescale 1ns/1ps
`default_nettype none
`include "./generated_shifters/shifter_ll5.sv"
`include "./generated_shifters/shifter_rl5.sv"
`include "./generated_shifters/shifter_ra5.sv"

module test_shifter5;

    int errors = 0;

    logic signed [4:0] a;
    logic [2:0] s;
    wire [4:0] y_ll;
    wire [4:0] y_rl;
    wire [4:0] y_ra;

    shifter_ll5 UUT_ll(.a(a), .s(s), .y(y_ll));
    shifter_rl5 UUT_rl(.a(a), .s(s), .y(y_rl));
    shifter_ra5 UUT_ra(.a(a), .s(s), .y(y_ra));


    // Some behavioural comb. logic that computes correct values.
    logic [4:0] correct_out_ll;
    logic [4:0] correct_out_rl;
    logic [4:0] correct_out_ra;

    always_comb begin : behavioural_solution_logic
        if(s >= 5) begin
            correct_out_ll = 5'b0;
            correct_out_rl = 5'b0;
            correct_out_ra = 5'b0;
        end else begin
            correct_out_ll = a << s;
            correct_out_rl = a >> s;
            correct_out_ra = a >>> s;
        end
    end

    // You can make "tasks" in testbenches. Think of them like methods of a class, 
    // they have access to the member variables.
    task print_io;
        $display("%b %b | %b (%b), %b (%b), %b (%b)", s, a, y_ll, correct_out_ll, y_rl, correct_out_rl, y_ra, correct_out_ra);
    endtask

    time i; // 64-bit integer, not 32
    // 2) the test cases - initial blocks are like programming, not hardware
    initial begin
    $dumpfile("././generated_shifters/shifter5.fst");
    $dumpvars(0, UUT_ll);
    $dumpvars(0, UUT_rl);
    $dumpvars(0, UUT_ra);
    
    $display("Checking all inputs.");
$display("s   a        | y (correct out)");
    for (i = 0; i < 1024; i = i + 1) begin
        a[4:0] = $random;

        s[2:0] = $random;

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
            $display("  ERROR: shifter_ra out should be %b, is %b", correct_out_ra, y_ra);
            errors = errors + 1;
        end
    end

endmodule
