import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
currentk = None
vsum = 0
vcount= 0

for line in sys.stdin:
    line = line.strip()
    k, v = line.split("\t")
    v = int(v)
    if k == currentk:
        vsum += v
        vcount += 1
    else:
        if currentk is not None:
            print(currentk + "\t" + str(float(vsum)) + "\t" + str(vsum/vcount))
        currentk = k
        vsum = v
        vcount = 1
        
print(currentk + "\t" + str(float(vsum)) + "\t" + str(vsum/vcount))