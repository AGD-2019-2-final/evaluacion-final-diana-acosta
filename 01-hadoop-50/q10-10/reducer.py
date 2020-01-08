import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
currentk = None
nums = []

for line in sys.stdin:
    k, v = line.split("\t")
    v = int(v)
    if k == currentk:
        nums.append(v)
    else:
        if currentk is not None:
            nums.sort()
            print(currentk + "\t" + str(nums).replace("[", "").replace("]", "").replace(" ", ""))
        currentk = k
        nums = [v]
nums.sort()
print(currentk + "\t" + str(nums).replace("[", "").replace("]", "").replace(" ", ""))