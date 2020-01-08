import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
    col1 = ""
    line = line.strip()
    splits = line.split("   ")
    col1 = splits[0]
    print(col1)