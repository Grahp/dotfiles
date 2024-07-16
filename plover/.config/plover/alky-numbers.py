LONGEST_KEY = 1

def lookup(CHORD: tuple[str]):
    STROKE = CHORD[0]

    match = re.fullmatch(r'(#?)(S?T?K?P?W?H?R?)(A?O?E?U?)([-*]?)([FRPB])([LGTS]*)', STROKE)
    if match is None:
        raise KeyError


    (NUMBER, LEFT_HAND, VOWELS, SEPERATOR, NUMPAD0, NUMPAD1) = match.groups()


