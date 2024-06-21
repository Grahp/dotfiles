# It's the numbers!

import re

# Options
AUTOMATIC_ZEROS = True
STARTER = '#' # Can be set to anything with ^+#S, the rest is used elsewhere

# Strokes Dict
# ^#T12* *1212D
# +SK34* *3434Z
#     12 34
NUMBERS_DICT = {
    '2':    '1',
    '4':    '3',
    '12':   '4',
    '1234': '5',
    '24':   '2',
    '34':   '6',
    '1':    '7',
    '13':   '8',
    '3':    '9',
    '14':   '.',
    '23':   ','
}

PREFIXES = {
    'TK': '$'
}


LONGEST_KEY = 1

def stroke_to_numbers(letters: str, stroke: str) -> str:
    letter_to_number = {letter: str(index + 1) for index, letter in enumerate(letters)}
    
    new_stroke: list[str] = []
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

def numbers_check(numbers: str):
    if numbers in NUMBERS_DICT:
        return NUMBERS_DICT[numbers]
    elif len(numbers) == 3:
        return '0'
    return ''



def lookup(chord: list[str]):

    assert len(chord) <= LONGEST_KEY

    stroke = chord[0]

    stroke = convert_numbers_to_strokes(stroke)

    # Split stroke into groups
    match = re.fullmatch(r'(#?\+?S?)(T?K?)(P?W?H?R?)(A?O?E?U?)([-*]?)([FRPB]*)([LGTS]*)', stroke)
    if match is None:
        raise KeyError

    numpad: list[str] = [''] * 4

    (starter, prefix, numpad[0], numpad[1], _, numpad[2], numpad[3]) = match.groups()
    
    if STARTER not in starter:
        raise KeyError

    NUMPAD_NUMBERS = [ 'PWHR', 'AOEU', 'FRPB', 'LGTS' ]

    output = ''

    if prefix in PREFIXES:
        output += PREFIXES[prefix]
    
    previous_non_empty = False

    for i in range(len(NUMPAD_NUMBERS)):
        if numpad[i] == '':
            if previous_non_empty and AUTOMATIC_ZEROS:
                output += '0'
            continue

        numbers = stroke_to_numbers(NUMPAD_NUMBERS[i], numpad[i])

        output += numbers_check(numbers)
        previous_non_empty = True

    return output
