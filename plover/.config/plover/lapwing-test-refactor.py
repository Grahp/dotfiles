import time, math, sys


# Live Matching Entries and % Display
# COLORS



# Cursor Stuff

def hide_cursor():
    sys.stdout.write("\033[?25l")
    sys.stdout.flush()

def show_cursor():
    sys.stdout.write("\033[?25h")
    sys.stdout.flush()

def read_file(file: str):
    with open(file, 'r') as f:
        return f.read()

def get_line_count(file: str) -> int:
    return read_file(file).count('\n') - 2

def print_bar(numerator: int, denominator: int):
    BAR_ELEMENTS = 20

    RATIO = numerator / denominator * 100
    corrected_ratio = RATIO / (100 / (BAR_ELEMENTS))
    eight_ratio = RATIO / (100 / (BAR_ELEMENTS * 8))
    filled_bar_elements = math.ceil(corrected_ratio)
    eight_elements = math.ceil(eight_ratio)

    bar = "["


    elements = eight_elements
    
    for _ in range(elements):
        while elements >= 8:
            bar += "█"
            elements -= 8
        while elements >= 7:
            bar += "▉"
            elements -= 7
        while elements >= 6:
            elements -= 6
            bar += "▊"
        while elements >= 5:
            bar += "▋"
            elements -= 5
        while elements >= 4:
            bar += "▌"
            elements -= 4
        while elements >= 3:
            bar += "▍"
            elements -= 3
        while elements >= 2:
            bar += "▎"
            elements -= 2
        while elements >= 1:
            bar += "▏"
            elements -= 1

    for _ in range(BAR_ELEMENTS - filled_bar_elements):
        bar += " "

    bar += "]"

    print(f"                                                ", end='\r', flush=True)
    print(f"  Working... {bar}\n\n\n", end='\r', flush=True)
    sys.stdout.write("\033[F\033[F\033[F")


def count_matches(file: str, alt_file: str, file_line_count: int) -> int:

    json = read_file(alt_file).splitlines()

    matching_counter = 0
    with open(file, 'r') as f:
        for lines, line in enumerate(f, start=0):
            # time.sleep(0.003)

            print_bar(lines - 1, file_line_count)

            line = line.strip()

            if line in json:
                matching_counter += 1
                continue

    return matching_counter

def main():
    if __name__ == "__main__":
        file = '/home/grahp/.config/plover/grahpwing.json'
        alt_file = '/home/grahp/.config/plover/lapwing-base.json'

        # file = '/home/grahp/.config/plover/lapwing-base.json'
        # alt_file = '/home/grahp/.config/plover/main.json'

        hide_cursor()
        
        print("  Working...")
        print("  Matching Entries: ...")
        print("  % of Matching Entries: ...")
        print("")
        sys.stdout.write("\033[F\033[F\033[F\033[F")
        sys.stdout.flush()

        file_line_count = get_line_count(file)

        try:
            match_count = count_matches(file, alt_file, file_line_count)
        except KeyboardInterrupt:
            show_cursor()
            return

        print(f"\n  Matching Entries: {match_count} / {file_line_count}")
        percent = int(( match_count / file_line_count ) * 100)
        print(f"  % of Matching Entries: {percent}%")

main()
show_cursor()
