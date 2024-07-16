import re

LONGEST_KEY = 1

NUMBER_KEY = "#"
UNFORMATTED_NUMBER = "#TPH"

def lookup(CHORD: tuple[str]):
    STROKE = CHORD[0]

    if NUMBER_KEY not in STROKE:
        raise KeyError

    MATCH = re.fullmatch(r'(#?S?T?K?P?W?H?R?)(A?O?E?U?)([-*]?)([FRPB])([LGTS]*)', STROKE)
    if MATCH is None:
        raise KeyError

    (LEFT_HAND, VOWELS, SEPERATOR, NUMPAD0, NUMPAD1) = MATCH.groups()

    if UNFORMATTED_NUMBER in STROKE:
        return "oh it's in there all right"
