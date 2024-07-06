# 1 Number at a time?
# 2 Numbers at a time?
# No, 4 Numbers at a time!

import re

LONGEST_KEY = 1

def stroke_to_numbers(letters: str, stroke: str):
    char_to_num = {letters[i]: str(i + 1) for i in range(len(letters))}
    return ''.join(char_to_num.get(char, char) for char in stroke)

def lookup(chord: list[str]):

    stroke = chord[0]

    # Turn number bullshit into real strokes
    if any(k in stroke for k in "1234506789"):
        stroke = list(stroke)
        numbers = ["O", "S", "T", "P", "H", "A", "F", "P", "L", "T"]
        for key in range(len(stroke)):
            if stroke[key].isnumeric():
                stroke[key] = numbers[int(stroke[key])]
        stroke = ["#"] + stroke
        stroke = "".join(stroke)


    number_outputs = {
        '1':    '7',
        '2':    '1',
        '3':    '9',
        '4':    '3',
        '12':   '4',
        '13':   '8',
        '24':   '2',
        '34':   '6',
        # If length == 3, it's 0
        '1234': '5'
    }

    # Split stroke into groups
    match = re.fullmatch(r'([#]*)(\+?S?)(T?K?)(P?W?H?R?)(A?O?E?U?)([-*]?)([FRPB]*)([LGTS]*)', stroke)
    if match is None:
        raise KeyError

    (starter, useless, prefix, numpad1, numpad2, t, numpad3, numpad4) = match.groups()

    if '#' not in starter:
        raise KeyError

    ret = ''



    def check1(ret: str): 
        if numpad1 is not '':
            numbers = stroke_to_numbers('PWHR', numpad1)
            if len(numbers) == 3:
                ret += '0'
                return ret
            if numbers in number_outputs:
                ret += number_outputs[numbers]
        return ret
    
    def check2(ret: str): 
        if numpad2 is not '':
            numbers = stroke_to_numbers('AOEU', numpad2)
            if len(numbers) == 3 or len(numbers) == 0:
                if numpad1 is not '':
                    ret += '0'
                    return ret
            if numbers in number_outputs:
                ret += number_outputs[numbers]
        return ret
    
    def check3(ret: str): 
        if numpad3 is not '':
            numbers = stroke_to_numbers('FRPB', numpad3)
            if len(numbers) == 3 or \
            (len(numbers) == 0 and numpad1 is not '') or \
            (len(numbers) == 0 and numpad2 is not ''):
                ret += '0'
                return ret
            if numbers in number_outputs:
                ret += number_outputs[numbers]
        return ret
    

    def check4(ret: str): 
        if numpad4 is not '':
            numbers = stroke_to_numbers('LGTS', numpad4)
            if len(numbers) == 3 or \
            (len(numbers) == 0 and numpad1 is not '') or \
            (len(numbers) == 0 and numpad2 is not '') or \
            (len(numbers) == 0 and numpad3 is not ''):
                ret += '0'
                return ret
            if numbers in number_outputs:
                ret += number_outputs[numbers]
        return ret

    ret = check1(ret)
    ret = check2(ret)
    ret = check3(ret)
    ret = check4(ret)

    return ret
