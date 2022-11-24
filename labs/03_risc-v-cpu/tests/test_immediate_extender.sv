`timescale 1ns/1ps
`default_nettype none
// `include "hdl/immediate_extender.sv"

module test_immediate_extender;

    int errors = 0;

    logic [19:0] immediate;
    logic [1:0] control;
    wire [31:0] out;

    immediate_extender UUT(.immediate(immediate), .control(control), .out(out));


    // Some behavioural comb. logic that computes correct values.
    logic [31:0] correct_out;

    // You can make "tasks" in testbenches. Think of them like methods of a class, 
    // they have access to the member variables.
    task print_io;
        $display("%b %b | %b (%b)", control, immediate, out, correct_out);
    endtask

    integer change;
    time i; // 64-bit integer, not 32
    // 2) the test cases - initial blocks are like programming, not hardware
    initial begin
    $dumpfile("immediate_extender.fst");
    $dumpvars(0, UUT);
    
    $display("Checking all inputs.");
$display("control  immediate    | out (correct out)");
    change = 0;
    for (i = 0; i < 5; i = i + 1) begin
        case(i) // ibuj
        0: begin
            immediate = 20'b1010_0000_0000_0000_1010;
            control = 0;
            correct_out = 32'b0000_0000_0000_0000_0000_0000_0000_1010;
            change = 1;
        end
        1: begin
            immediate = 20'b1010_0000_0000_0000_1010;
            control = 1;
            correct_out = 32'b0000_0000_0000_0000_0000_0000_0001_0100;
            change = 2;
        end
        2: begin
            immediate = 20'b1010_0000_0000_0000_1010;
            control = 2;
            correct_out = 32'b1111_1111_1111_1010_0000_0000_0000_1010;
            change = 3;
        end
        3: begin
            immediate = 20'b1010_0000_0000_0000_1010;
            control = 3;
            correct_out = 32'b1111_1111_1111_1010_0000_0000_0001_0100;
            change = 4;
        end
        4: begin
            immediate = 20'b1010_0000_1001_0000_1010;
            control = 0;
            correct_out = 32'b1111_1111_1111_1111_1111_1001_0000_1010;
            change = 5;
        end
        endcase
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
    always @(change) begin
        assert(out === correct_out) else begin
            $display("  ERROR\n=============\n----%b----\n---(%b)---\n=============", out, correct_out);
            errors = errors + 1;
        end
    end

endmodule
