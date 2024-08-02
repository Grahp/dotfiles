def process_file(input_file: str, output_file: str) -> None:
    # Read lines from the input file
    with open(input_file, 'r') as file:
        lines = file.readlines()

    # Append "#" to each line
    count = 0
    with open(output_file, 'w') as outfile:
        for line in lines:
            # modified_line = '#' + line
            if "-" in line:
                count += 1
            # _ = outfile.write(modified_line)
    print(f"count: {count}")

# Example usage:
process_file('./lapwing-prefixed-proper-nouns.json', 'output.txt')

