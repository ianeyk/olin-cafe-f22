import sys

from left_shifter_generator import LeftShifterGenerator
from right_shifter_generator import RightShifterGenerator
from arithmetic_shifter_generator import ArithmeticShifterGenerator
from shifter_test_generator import ShifterTestGenerator

def generate_shifter(n, dir):
    mux_gen = LeftShifterGenerator(n, dir)
    mux_gen = RightShifterGenerator(n, dir)
    mux_gen = ArithmeticShifterGenerator(n, dir)
    mux_test = ShifterTestGenerator(n, dir)

if __name__ == '__main__':
    n = sys.argv[1]
    generate_shifter(int(n), dir = "./generated_shifters")
    
# generate_mux(int(12), dir = "./") // uncomment for debugging