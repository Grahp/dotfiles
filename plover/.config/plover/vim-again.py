import os
import re

LONGEST_KEY = 1


# To-Do:
# SWAP_SHIFT
# Clipboard Register
# Fingerspelling

# Options
ENTER_MODE_STROKE = "KWR"
MOTION_STARTER = "STPR"
# Whether to center the screen around the cursor with every motion
STAY_CENTERED = False
# Swap the shifts to the other thumb key (Useful if you use inner thumber keys)
SWAP_SHIFT = False
CLIPBOARD_REGISTER = "+"
# Add stuff to the start & end of every outputted stroke
STROKE_PREFIX = ''
STROKE_SUFFIX = ''

# 
NORMAL_OVERRIDES = {
    'SKWR-R': '{^}{#Super_L(3)}{PLOVER:DELAY:0.05}{^}{#Escape}{^ ^}on{^}{-|}'
}

ACTIONS = {
    'K': ['p', 'P'],
    'P': ['x', 'D'],
    'W': ['y', 'Y'],
    'PH': ['di', 'Y'],
}

EXIT_ACTIONS = {
    'H': ['a', 'A', '', ''],
    'R': ['i', 'I', '', ''],
    'HR': ['o', 'O', '', ''],
}

MOTIONS = {
    # Stroke
    #      Default
    #           Shift
    #                g
    #                     Shift + g
    'R': ['h', 'H', '_', ''],
    'B': ['j', 'J', 'gj', ''],
    'P': ['k', 'K', 'gk', ''],
    'G': ['l', 'L', 'g_', ''],
    'BG': ['w', 'W', 'gw', 'gW'],
    'RB': ['b', 'B', 'ge', 'gE'],
    'FPL': ['{#Control_L(u)}', '{#Control_L(b)}{#Control_L(b)}', '{#Control_L(b)}{#Control_L(b)}', ''],
    'RBG': ['{#Control_L(d)}', '{#Control_L(f)}', '{#Control_L(f)}', ''],
    'FR': ['0', '', '_', ''],
    'LG': ['$', '', 'g_', ''],
}

VOWEL_MOTIONS = {
    'E': 'gk',
    'EU': 'gj',
    # 'O': ['', '', 'u', '{#Control_L(r)}']
    'O': 'u',
    'AO': 'U'
}

def write_to_fileIO(FILE_PATH: str, CONTENT: str):
    with open(FILE_PATH, 'w') as FILE:
        _ = FILE.write(CONTENT)

def qw(CONTENT: str):
    FILE_PATH = os.path.join("/home/grahp/.config/plover/", "vim_log.txt")
    write_to_fileIO(FILE_PATH, CONTENT)


global vim_mode
vim_mode = False

def lookup(CHORD: tuple[str]):
    STROKE = CHORD[0]

    global vim_mode
    add_escape = False
    if STROKE in NORMAL_OVERRIDES and not vim_mode:
        return NORMAL_OVERRIDES[STROKE]

    if MOTION_STARTER in STROKE:
        vim_mode = True
        add_escape = True
    elif STROKE == ENTER_MODE_STROKE:
        vim_mode = True
        return "{#Escape}"
    if not vim_mode:
        raise KeyError


    match = re.fullmatch(r'(#?)(S?T?K?P?W?H?R?)(A?O?E?U?)([-*]?)([FRPBLGTSDZ]*)', STROKE)
    if match is None:
        raise KeyError


    (_NUMBER, LEFT_HAND, VOWELS, _, RIGHT_HAND) = match.groups()



    output: str = ""
    exit_action = True

    offset = 0
    if 'E' in VOWELS:
        offset += 2
    if 'U' in VOWELS:
        offset += 1

    if RIGHT_HAND in MOTIONS:
        output = MOTIONS[RIGHT_HAND][offset]
    elif VOWELS in VOWEL_MOTIONS:
        output = VOWEL_MOTIONS[VOWELS]
    if LEFT_HAND in ACTIONS:
        output = ACTIONS[LEFT_HAND][offset]
    elif LEFT_HAND in EXIT_ACTIONS:
        output = EXIT_ACTIONS[LEFT_HAND][offset]
        exit_action = False
        vim_mode = False
    
    output = "{^}" + output
    if add_escape:
        output = "{#Escape}" + output
    if STAY_CENTERED and exit_action:
        output = output + "{^}zz"
    return output
