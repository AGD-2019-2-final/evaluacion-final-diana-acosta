import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
count = [1, 2, 3, 4, 5, 6, 7]

for line in sys.stdin:
    line = line.strip()
    n, d, l = line.split("\t")
    n = int(n)
    if n in count:
        print(l + "\t" + d + "\t" + str(n))