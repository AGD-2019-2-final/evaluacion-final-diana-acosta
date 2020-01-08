import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
currentk = None
count = 0

for line in sys.stdin:
    line = line.strip()
    if line == currentk:
        count += 1
    else:
        if currentk is not None:
            print(currentk + "\t" + str(count))
        currentk = line
        count = 1
        
print(currentk + "\t" + str(count))
