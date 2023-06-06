n = int(input('Введите число: '))
print()
q = n - 1
while q >= 0:
    for i in range(-n, n + 1):
        if abs(i) > q:
            print(abs(i), end='')
        elif i == 0:
            print(end='')
        else:
            print('.', end='')
    q -= 1
    print()