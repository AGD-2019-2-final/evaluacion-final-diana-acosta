import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        purpose = ""
        amount = ""
        line = line.strip()
        splits = line.split(",")
        if splits[3] != 'purpose':
            purpose = splits[3]
            amount = splits[4]
            print(purpose + "\t" + amount)