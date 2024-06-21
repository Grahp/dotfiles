# It's the numbers!

import re

LONGEST_KEY = 1

def stroke_to_numbers(letters: str, stroke: str) -> str:
    letter_to_number = {letter: str(index + 1) for index, letter in enumerate(letters)}
    
    new_stroke = []
    for char in stroke:
        new_stroke.append(letter_to_number.get(char, char))
    
    return ''.join(new_stroke)

def convert_numbers_to_strokes(stroke: str) -> str:
    if any(char.isdigit() for char in stroke):
        stroke_list = list(stroke)
        number_to_stroke = ["O", "S", "T", "P", "H", "A", "F", "P", "L", "T"]
        for i, char in enumerate(stroke_list):
            if char.isdigit():
                stroke_list[i] = number_to_stroke[int(char)]
        stroke = "#" + "".join(stroke_list)
    return stroke



def lookup(chord: list[str]):

    assert len(chord) <= LONGEST_KEY

    stroke = chord[0]

    stroke = convert_numbers_to_strokes(stroke)

    numbers_dict  = {
        '2':    '1',
        '24':   '2',
        '4':    '3',
        '12':   '4',
        '1234': '5',
        '34':   '6',
        '1':    '7',
        '13':   '8',
        '3':    '9',
        '14':   '.',
        '23':   ','
    }

    # Split stroke into groups
    match = re.fullmatch(r'([#]*)(\+?S?)(T?K?)(P?W?H?R?)(A?O?E?U?)([-*]?)([FRPB]*)([LGTS]*)', stroke)
    if match is None:
        raise KeyError

    numpad: list[str] = [''] * 4

    (starter, _, _prefix, numpad[0], numpad[1], _, numpad[2], numpad[3]) = match.groups()
    
    if '#' not in starter:
        raise KeyError

    numpad_numbers = [ 'PWHR', 'AOEU', 'FRPB', 'LGTS' ]

    output = ''
    
    previous_non_empty = False

    for i in range(4):
        if numpad[i] == '':
            if previous_non_empty:
                output += '0'
            continue

        numbers = stroke_to_numbers(numpad_numbers[i], numpad[i])

        def numbers_check(numbers: str):
            if numbers in numbers_dict:
                return numbers_dict[numbers]
            elif len(numbers) == 3:
                return '0'
            return ''

        current_output = numbers_check(numbers)
        output += current_output
        previous_non_empty = True

    return output
