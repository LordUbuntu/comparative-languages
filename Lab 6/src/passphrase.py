# Jacobus Burger
# CMPT 360A, Spring 2021
# Lab Assignment 6
# Pass-phrase generation in Python
from random import choice

# settings
default_dictionary = "words"  # path of dictionary file relative to script

# generate a list of words from the dictionary
words = [
    word
    for line in open(default_dictionary, "r").readlines()
    for word in line.lower().strip("\n").split()
]


def passphrase(length):
    # select $length random words, avoiding repetitions
    phrase = []
    while len(phrase) < length:
        word = choice(words)
        if word not in phrase:
            phrase.append(word)

    # return the phrase as a space-delimited string
    return " ".join(phrase)


def main():
    # get user input
    phrases = int(input("how many passphrases should be generated (>0)? "))
    length = int(input("how many words in each passphrase (>5)? "))

    # ensure valid input
    phrases = phrases if phrases > 0 else 1
    length = length if length > 5 else 5

    # generate passphrases
    output = "\n\n"
    for _ in range(phrases):
        phrase = passphrase(length)
        output += phrase + "\n"
    print(output)


if __name__ == "__main__":
    main()
