import sys

from shifter_generator import ShifterGenerator
from shifter_test_generator import ShifterTestGenerator

def generate_shifter(n, dir):
    mux_gen = ShifterGenerator(n, dir)
    mux_test = ShifterTestGenerator(n, dir)

if __name__ == '__main__':
    n = sys.argv[1]
    generate_shifter(int(n), dir = "./generated_shifters")
    
# generate_mux(int(12), dir = "./") // uncomment for debugging