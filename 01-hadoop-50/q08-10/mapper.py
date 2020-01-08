import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
    col1 = ""
    col3 = ""
    line = line.strip()
    splits = line.split("   ")
    col1 = splits[0]
    col3 = splits[2]
    print(col1 + "\t" + col3)
