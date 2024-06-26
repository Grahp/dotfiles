LONGEST_KEY = 2

SHOW_STROKE_STENO = 'STR-BG'

def lookup(key: list[str]):
    assert len(key) <= LONGEST_KEY, '%d/%d' % (len(key), LONGEST_KEY)
    if SHOW_STROKE_STENO != key[0]:
        raise KeyError
    if len(key) == 1:
        return ' '
    return key[1]
