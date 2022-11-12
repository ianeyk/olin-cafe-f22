import sys

from mux_generator import MuxGenerator
from mux_test_generator import MuxTestGenerator

def generate_mux(n, dir):
    mux_gen = MuxGenerator(n, dir)
    mux_test = MuxTestGenerator(n, dir)

if __name__ == '__main__':
    n = sys.argv[1]
    generate_mux(int(n), dir = "./generated_muxes")
    
# generate_mux(int(12), dir = "./") // uncomment for debugging