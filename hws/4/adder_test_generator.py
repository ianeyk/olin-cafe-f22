import math

class AdderTestGenerator:
    def __init__(self, n: int = 4, adder_dir: str = "./Ian_Eykamp/circuits/adder_n/generated_adders") -> None:
        self.n = n

        self.adder_dir = adder_dir
        
        sv = self.generate_sv()
        # print(sv)
        self.write_file(sv)
    
    def write_file(self, txt: str) -> None:
        assert(self.n > 1) # we cannot overwrite adder1, because this referred to in the base case in the above code!
        f = open(f"{self.adder_dir}/test_adder{self.n}.sv", "w")
        f.write(txt)
        f.close()
    
    def generate_sv(self) -> str:
        n = self.n

        file_header = """`timescale 1ns/1ps
`default_nettype none
"""

        module_header = f"""
module test_adder{n};

int errors = 0;

logic [{n - 1}:0] a, b;
logic cin;
wire [{n - 1}:0] s;
wire cout;

adder{n} UUT(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

"""

        module_body = f"""
    // Some behavioural comb. logic that computes correct values.
    logic [{n - 1}:0] correct_s;
    logic correct_cout;
    logic [{n}:0] extra_bit_sum;

    always_comb begin : behavioural_solution_logic
        extra_bit_sum = a + b + cin;
        correct_s = extra_bit_sum[{n - 1}:0];
        correct_cout = extra_bit_sum[{n}];
    end

    // You can make "tasks" in testbenches. Think of them like methods of a class, 
    // they have access to the member variables.
    task print_io;
        $display("%b %b  %b  | %b %b (%b %b)", a, b, cin, cout, s, correct_cout, correct_s);
    endtask

    time i; // 64-bit integer, not 32
    // 2) the test cases - initial blocks are like programming, not hardware
    initial begin
        $dumpfile("./{self.adder_dir}/test_adder{n}.fst");
        $dumpvars(0, UUT);
        
        $display("Checking all inputs.");
{self.make_test_loop()}
    """

        module_footer = r"""
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
    always @(a or b or cin) begin
        assert((s === correct_s) & (cout === correct_cout)) else begin
            // $display("  ERROR: mux out should be %b, is %b", out, correct_out);
            errors = errors + 1;
        end
    end

endmodule
"""

        return file_header + module_header + module_body + module_footer
    
    def make_test_loop(self):
        n = self.n
        
        sample_size = 10
        
        # for fewer than 10-bit numbers, exhaustively check all inputs
        if (n + n + 1) <= sample_size:
            # , a, b, cin, cout, s, correct_cout, correct_s);
            body = f"""
        $display("a{' ' * n}b{' ' * n}cin | cout s{' ' * n} (correct cout, correct s)");
        for (i = 0; i < {2 ** (n + n + 1)}; i = i + 1) begin
            a = i[{n - 1}:0];
            b = i[{n + n - 1}:{n}];
            cin = i[{n + n}];
            #1 print_io();
        end"""
        
        # for more than 10-bit numbers, just randomly choose 2^10 inputs to test
        else: 
            body = f"""
        $display("a{' ' * n}b{' ' * n}cin | cout s{' ' * n} (correct cout, correct s)");
        for (i = 0; i < {2 ** sample_size}; i = i + 1) begin
{self.random_int_n_bits(var_name = "a", size = n)}
{self.random_int_n_bits(var_name = "b", size = n)}
            cin = $random;
            #1 print_io();
        end"""
        
        return body
    
    def random_int_n_bits(self, var_name: str, size: int):
        prev_bit_idx = 0
        bit_idx = 31
        assignment = ""
        while bit_idx < size - 1:
            assignment += f"""            {var_name}[{bit_idx}:{prev_bit_idx}] = $random;
"""
            prev_bit_idx = bit_idx
            bit_idx += 32
        # then
        assignment += f"""            {var_name}[{size - 1}:{prev_bit_idx}] = $random;
"""
        
        return assignment