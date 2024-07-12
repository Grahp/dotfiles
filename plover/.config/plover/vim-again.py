import subprocess

LONGEST_KEY = 1

def notif(message: str):
    _ = subprocess.run(['notify-send', 'Vim', message])

def lookup(chord: tuple[str]):
    # send_notification('Test Title', 'This is a test message.')
    # stroke = chord[-1]
    # if stroke == 'SKW':
    # notif(stroke)
    # notif(str(chord))
    stroke = chord[0]
    notif(stroke)
    raise KeyError
