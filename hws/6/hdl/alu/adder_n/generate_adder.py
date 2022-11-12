import sys

from adder_generator import AdderGenerator
from adder_test_generator import AdderTestGenerator

def generate_adder(n, dir):
    mux_gen = AdderGenerator(n, dir)
    mux_test = AdderTestGenerator(n, dir)

if __name__ == '__main__':
    n = sys.argv[1]
    generate_adder(int(n), dir = "./generated_adders")
    
# generate_adder(int(12), dir = "./Ian_Eykamp/circuits/adder_n/generated_adders") # uncomment for debugging