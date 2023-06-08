num = int(input('Введите число: '))
print()
q = num - 1
while q >= 0:
    for i in range(-num, num + 1):
        if abs(i) > q:
            print(abs(i), end='')
        elif i == 0:
            print(end='')
        else:
            print('.', end='')
    q -= 1
    print()