import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
    col1 = ""
    col2 = ""
    line = line.strip()
    splits = line.split("\t")
    col1 = splits[0]
    col2 = splits[1]
    for i in col2.split(","):
        print(i + "\t" + col1)