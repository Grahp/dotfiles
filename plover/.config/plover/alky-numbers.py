import re, os

LONGEST_KEY = 1

NUMBER_KEY = "#"
NUMBER_STROKE = "#TPH"
PERIOD_NUMBER_STROKE = "#P"

NUMPAD_1 = {
    "E" : "0",
    "F" : "1",
    "FP" : "2",
    "P" : "3",
    "FR" : "4",
    "FRPB" : "5",
    "PB" : "6",
    "R" : "7",
    "RB" : "8",
    "B" : "9"
}

NUMPAD_2 = {
    "U" : "0",
    "L" : "1",
    "LT" : "2",
    "T" : "3",
    "LG" : "4",
    "LGTS" : "5",
    "TS" : "6",
    "G" : "7",
    "GS" : "8",
    "S" : "9"
}


def write_to_fileIO(FILE_PATH: str, CONTENT: str):
    with open(FILE_PATH, 'w') as FILE:
        _ = FILE.write(CONTENT)

def qwIO(CONTENT: str):
    FILE_PATH = os.path.join("/home/grahp/.config/plover/", "vim_log.txt")
    write_to_fileIO(FILE_PATH, CONTENT)


def lookup(CHORD: tuple[str]):
    STROKE = CHORD[0]

    if NUMBER_KEY not in STROKE:
        raise KeyError

    MATCH = re.fullmatch(r'(#?S?T?K?P?W?H?R?)(A?O?E?U?)([-*]?)([FRPB]*)([LGTS]*)', STROKE)
    if MATCH is None:
        raise KeyError

    (LEFT_HAND, VOWELS, SEPERATOR, GROUP_NUMPAD_1, GROUP_NUMPAD_2) = MATCH.groups()


    output = ""

    # Prefixes
    if PERIOD_NUMBER_STROKE in LEFT_HAND:
        output = "0."
    elif NUMBER_STROKE in LEFT_HAND:
        output = ""

    if GROUP_NUMPAD_1 in NUMPAD_1:
        output = NUMPAD_1[GROUP_NUMPAD_1]
        if GROUP_NUMPAD_2 is '':
            output += '0'
    if GROUP_NUMPAD_2 is not '':
        output += NUMPAD_2[GROUP_NUMPAD_2]

    return output

