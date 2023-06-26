number = int(input('Введите число: '))
for row in range(1, number + 1):
    for col in range(row):
        print(row, end=' ')
    print()