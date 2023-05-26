n = int(input('Введите число: '))
for row in range(n+1):
    for cow in range(n+1):
        print(row + cow, end = '\t')
    print()
    