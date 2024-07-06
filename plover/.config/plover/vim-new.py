# import re

LONGEST_KEY = 1

ACTIONS = {}
MOTIONS = {}
OVERRIDES = {
    'SKWR-R': '{^}{#Super_L(3)}{PLOVER:DELAY:0.05}{^}{#Escape}{^ ^}on{^}{-|}'
}



def convert_numbers_to_strokes(stroke: str) -> str:
    if any(char.isdigit() for char in stroke):
        stroke_list = list(stroke)
        number_to_stroke = ["O", "S", "T", "P", "H", "A", "F", "P", "L", "T"]
        for i, char in enumerate(stroke_list):
            if char.isdigit():
                stroke_list[i] = number_to_stroke[int(char)]
        stroke = "#" + "".join(stroke_list)
    return stroke



def lookup(chord: list[str]) -> str:
    assert len(chord) <= LONGEST_KEY

    stroke = chord[0]
    
    if stroke in OVERRIDES:
        return OVERRIDES[stroke]

    # # Split stroke into groups
    # match = re.fullmatch(r'(#?\+?S?)(T?K?)(P?W?H?R?)(A?O?E?U?)([-*]?)([FRPB]*)([LGTS]*)', stroke)
    # if match is None:
    #     raise KeyError
    #
    # numpad: list[str] = [''] * 4
    #
    # (starter, prefix, numpad[0], numpad[1], _, numpad[2], numpad[3]) = match.groups()

    raise KeyError
