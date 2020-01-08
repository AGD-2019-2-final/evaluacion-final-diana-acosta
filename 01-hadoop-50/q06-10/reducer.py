import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
currentk = None
v_max = 0
v_min = 0

for line in sys.stdin:
    line = line.strip()
    k, v = line.split("\t")
    if k == currentk:
        if v > v_max:
            v_max = v
        if v < v_min:
            v_min = v
    else:
        if currentk is not None:
            print(currentk + "\t" + str(v_max) + "\t" + str(v_min))
        currentk = k
        v_max = v
        v_min = v
        
print(currentk + "\t" + str(v_max) + "\t" + str(v_min))
    