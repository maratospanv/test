numSeq = int(input('Введите количество чисел: '))
for num in range(numSeq):
    number = int(input('Введите число: '))
    count = 0
    for seq in range(num):
        print (seq)
        if seq  // 2 == 0:
            count += 1
print('Простых чисел', count)