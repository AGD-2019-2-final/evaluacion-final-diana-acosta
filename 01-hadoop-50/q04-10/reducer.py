import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
current_letter = None
count = 0

for line in sys.stdin:
    line = line.strip()
    if line == current_letter:
        count += 1
    else:
        if current_letter is not None:
            print(current_letter + "," + str(count))
        current_letter = line
        count = 1
        
print(current_letter + "," + str(count))
