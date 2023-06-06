numSeq = int(input('Введите количество чисел: '))
print()
count = 0
for num in range(1, numSeq + 1):
    number = int(input('Введите число: '))
    for seq in range(2, num):
        if num % seq == 0:
            break
        else:
            count += 1
print()
print('Простых чисел в последовательности', count)