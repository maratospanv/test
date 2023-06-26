n = int(input('Введите число: '))
for row in range(n+1):
    for col in range(n+1):
        print(row + col, end = '\t')
    print()