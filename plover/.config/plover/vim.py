# To-Do:
#   Unif writing and reading into the only places outside state is ever used, and clean up everything that uses it.
#   Fix your damn types
#   Break stroke into nice sections.
#       Beginning, left caps, U, G, right caps, end
#   Maybe a better way to handle state? Not with a file.
#   How do you specify return types? I believe read_file returns an optional string? I could be wrong about that, though.

import os

LONGEST_KEY = 1
vim_file = os.path.join("/home/grahp/.config/plover/state", "vim_mode")

# Writes String content to file
# Returns: void
def write_to_file(file_name, content):
    with open(file_name, 'w') as file:
        file.write(content)



def read_file(file_name: os.path):
    try:
        with open(file_name, 'r') as file:
            return file.read()
    except FileNotFoundError:
        return None



def vim_mode_enabled():
    enabled = read_file(vim_file)

    if enabled == 'True':
        return True

    if enabled == 'False':
        return False

    return None

def enable_vim_mode():
    write_to_file(vim_file, 'True')

def disable_vim_mode():
    write_to_file(vim_file, 'False')

def log(string: str):
    log_file = os.path.join("/home/grahp/.config/plover/state", "log")
    write_to_file(log_file, string)


# Returns: void
def toggle_vim_mode():
    contents = read_file(vim_file)

    if contents == None:
        enable_vim_mode()
        return

    if contents == 'True':
        disable_vim_mode()
        return

    if contents == 'False':
        enable_vim_mode()
        return
    enable_vim_mode()



# Returns: Plover Keystroke
def lookup(chord: list[str]):

    if chord[0] == '':
        stroke = chord[1]
    else:
        stroke = chord[0]
    full_stroke: str = '/'.join(chord)

    output: str = "Stroke: " + stroke + "   Full Stroke: " + full_stroke + "     Chord: " + str(chord)
    log(output)

    # if len(stroke) != 1:
    #     raise KeyError
    #
    # assert len(stroke) <= LONGEST_KEY

    # stroke = str(stroke)

    # Skip Stroke
    if stroke == 'SKWR-R':
        # return '{^}{#Super_L(3)}{^}{#Escape}{^ ^}on{^}{-|}'
        return '{^}{#Super_L(3)}{PLOVER:DELAY:0.05}{^}{#Escape}{^ ^}on{^}{-|}'
    # {#Control_L(Shift(Left))}{^}



    VIM_ENTER_CHORD = 'SKWR'
    # ALT_ENTER_CHORD = 'STPR'

    if stroke == VIM_ENTER_CHORD:
        write_to_file(vim_file, 'True')

        # Simulate Escape
        return '{#Escape}'

    if not vim_mode_enabled():
        raise KeyError

    if stroke == '*':
        write_to_file(vim_file, 'False')
        return '{#}' # Do nothing
    
    DICT = {
        'normal': {
            'P': 'x',
            'K': 'p',
            'W': 'y',
            'W': 'y',
            'A': 'u',
            'E': 'gg',
            'EU': 'G',
            '-G': 'l',
            '-R': 'h',
            '-B': 'j',
            '-P': 'k',
            '-BG': 'w',
            '-RB': 'b',
            '-S': 'l',
        },

        'exit': {
            'S': ':{^}',
            'T': 's',
            'H': 'a',
            'R': 'i',
            'HA': 'A',
            'RA': 'I',
        },

        'fingerspelling': {
            # '-P': 'f',
            # '-L': 't',
        }
    }

    if stroke in DICT['normal']:
        return '{^}' + DICT['normal'][stroke]

    if full_stroke in DICT['normal']:
        return '{^}' + DICT['normal'][full_stroke]

    if stroke in DICT['exit']:
        disable_vim_mode()
        return '{^}' + DICT['exit'][stroke]

    if full_stroke in DICT['exit']:
        disable_vim_mode()
        return '{^}' + DICT['exit'][full_stroke]
    
    return 'iuns'

actions = {
    # Stroke
    #     Solo
    #          Default
    #               Solo Capital
    #                    Capital
    'P': ['x', 'd', 'D', '']
}

motions = {
    # Stroke
    #      Default
    #            Capital
    #                 gx
    '-R': ['h', 'H', '_'],
    '-B': ['j', 'J', 'gj'],
    '-P': ['k', 'K', 'gk'],
    '-G': ['l', 'L', 'g_'],
    'BG': ['w', 'W', '']
}

# Overrides, for commands, and leaders and such
# overs = {
#     commands: [
#
#     ]
