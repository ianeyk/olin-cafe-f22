def main():
    output = ""
    for n in range(8):
        line = f"""
whole_array[{10 * (n + 1)}] = 0;
whole_array[{10 * (n + 1) + 8}:{10 * (n + 1) + 1}] = cells_in[{n * 8 + 7}:{n * 8}];
whole_array[{10 * (n + 1) + 9}] = 0;
"""
        output += line
    
    print(output)

main()