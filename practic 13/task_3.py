def contrariwise(num):
    if num == 0:
        print('\nПрограмма завершена!')
    while num > 0:
        s = num % 10
        num //= 10
        if s != 0:
            print(int(s), end='')

number = int(input('Введите число: '))
s1 = contrariwise(int(number))

print()

number2 = int(input('Введите число: '))
s2 = contrariwise(int(number2))
print()

print('Первое число наоборот: ', s1)

