import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
        col1 = ""
        col2 = ""
        line = line.strip()
        splits = line.split(",")
        col1 = splits[0]
        col2 = splits[1]
        print(col2 + "\t" + col1)