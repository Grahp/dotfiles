import time, math

def load_json_as_lines(json_file):
    with open(json_file, 'r') as f:
        data = f.read()
    return data.splitlines()

def get_line_count(file):
    with open(file, 'r') as f:
        return sum(1 for _ in f)

def count_matches(input_file, json_file, line_count):
    # Load JSON data as lines
    json_data_lines = load_json_as_lines(json_file)

    # Initialize counter
    counter = 0
    lines = 0
    last_output = -1

    bar_elements = 20

    # Read the input file and check for matches
    with open(input_file, 'r') as f:
        for line in f:
            time.sleep(0.001)

            line = line.strip()
            lines += 1
            if line in json_data_lines:
                counter += 1
            else:
                output = ( (lines / line_count )* 100)
                output = output / (100 / bar_elements)
                output = math.ceil(output)

                if output == last_output:
                    continue
                last_output = output

                bar = "    ["

                for _ in range(output):
                    bar += "#"
                for _ in range(bar_elements - output):
                    bar += "-"

                bar += "]"

                print(f"  Working... {bar}", end='\r', flush=True)

                if output == bar_elements:
                    print("")

    return counter

if __name__ == "__main__":
    input_file = '/home/grahp/.config/plover/grahpwing.json'  # Replace with your input file name
    json_file =  '/home/grahp/.config/plover/lapwing-base.json'

    line_count = get_line_count(input_file)
    
    match_count = count_matches(input_file, json_file, line_count)
    print(f"  Matching Entries: {match_count}")
    percent = int(( match_count / line_count ) * 100)
    print(f"  % of Matching Entries: {percent}%")

