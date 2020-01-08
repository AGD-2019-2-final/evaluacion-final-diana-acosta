import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
for line in sys.stdin:
    c2, c1 = line.split("\t")
    print(c1.strip() + "," + c2.strip())