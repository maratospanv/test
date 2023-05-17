n = int(input('Введите число: '))
for square in range(1, n // 2 + n % 2 + 1):
    square = square * 2 - 1
    print(square)
