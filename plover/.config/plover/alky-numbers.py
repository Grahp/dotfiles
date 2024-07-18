import re, os
LONGEST_KEY = 2

NUMBER_KEY = "#"
CLOCK_AM = "#KHR"
CLOCK_PM = "#KWHR"

PREFIX_STARTERS = {
    "#TPH": "",
    "#P": "0.",
    "#SP": "{^}.",
    "#TK": "$",
    "#STK": "S$",
    "#TKW": "€",
    "#TKPW": "₿",
    "#TKP": "£",
    "#TKR": "CN¥",
    "#TKR*": "JP¥"
}

PREFIX_DECORATION = {
    "#KHR": "#:## PM", # 500 -> 5:00 PM
    "#KHR*": "#:## AM" # 500 -> 5:00 PM
}

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

VOWELS_NUMBERS = {
    "E": "0",
    "U": "00",
    "EU": ",000",
    "AEU": "000"
}


def write_to_fileIO(FILE_PATH: str, CONTENT: str):
    with open(FILE_PATH, 'w') as FILE:
        _ = FILE.write(CONTENT)

def qwIO(CONTENT: str):
    FILE_PATH = os.path.join("/home/grahp/.config/plover/", "vim_log.txt")
    write_to_fileIO(FILE_PATH, CONTENT)

def concat(OUTPUT: list[str]) -> str:
    ret = ""
    for STRING in OUTPUT:
        ret += STRING
    return ret


def lookup(CHORD: tuple[str]) -> str:
    # STROKE = CHORD[0]

    output: str = ""
    for STROKE in CHORD:

        if NUMBER_KEY not in STROKE:
            raise KeyError

        MATCH = re.fullmatch(r'(\#?S?T?K?P?W?H?R?)(A?O?E?U?)([-*]?)([FRPB]*)([LGTS]*)', STROKE)
        if MATCH is None:
            raise KeyError
        if not MATCH[1]:
            raise KeyError

        (left_hand, VOWELS, SEPERATOR, GROUP_NUMPAD_1, GROUP_NUMPAD_2) = MATCH.groups()

        
        for STARTER in PREFIX_STARTERS:
            if "*" in SEPERATOR:
                left_hand += "*"
            if STARTER in left_hand:
                output += PREFIX_STARTERS[STARTER]

        # Numpad Nonsense
        if GROUP_NUMPAD_1 in NUMPAD_1:
            output += NUMPAD_1[GROUP_NUMPAD_1]
            if GROUP_NUMPAD_2 is '':
                output += '0'
        if GROUP_NUMPAD_2 is not '':
            output += NUMPAD_2[GROUP_NUMPAD_2]

        if VOWELS in VOWELS_NUMBERS:
            output += VOWELS_NUMBERS[VOWELS]

    return output

