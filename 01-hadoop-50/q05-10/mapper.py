import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
for line in sys.stdin:
    col2 = ""
    line = line.strip()
    splits = line.split("   ")
    col2 = splits[1]
    col2 = col2[5:7]
    print(col2)