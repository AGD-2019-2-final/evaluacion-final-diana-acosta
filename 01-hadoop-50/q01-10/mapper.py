import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        credit_his = ""
        line = line.strip()
        splits = line.split(",")
        credit_his = splits[2]
        print(credit_his + "\t" + "1")