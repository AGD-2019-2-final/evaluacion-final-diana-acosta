import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':
    currentk = None
    t = 0
    for line in sys.stdin:
        k, v = line.split("\t")
        v = int(v)
        if k == currentk:
            t = t + v
        else:
            if currentk is not None:
                print(currentk + " " + str(t))
            currentk = k
            t = v
    print(currentk + " " + str(t))