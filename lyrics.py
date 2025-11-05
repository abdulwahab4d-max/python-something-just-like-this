import time
import sys

def print_lyrics():
    lyrics = [
        "I've been reading books of old, the legends and the myths",
        "Achilles and his gold, Hercules and his gifts",
        "Spider-Man's control and Batman with his fists",
        "And clearly, I don't see myself upon that list",
        "But she said, Where d'you wanna go? How much you wanna risk?",
        "I'm not looking for somebody with some superhuman gifts",
        "Some superhero, some fairy tale bliss",
        "Just something I can turn to, somebody I can kiss",
        "I want something just like this",
        "Doo-doo-doo, doo-doo-doo \nDoo-doo-doo, doo, doo \nDoo-doo-doo, doo-doo-doo"
    ]

    delays = [
        1.2, 1.4, 2.0, 1.5, 1.7, 1.6, 1.5, 1.4, 1.3
    ]

    print("Something Just Like This : \n")
    time.sleep(6)

    for i, line in enumerate(lyrics):
        for char in line:
            sys.stdout.write(char)
            sys.stdout.flush()
            time.sleep(0.06)
        print()
        if i < len(delays):
            time.sleep(delays[i])
        else:
            time.sleep(0.8)

print_lyrics()
#comment
