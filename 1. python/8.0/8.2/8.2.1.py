number_cube = int(input('Введите число: '))
for num in range(1,number_cube//2+1):
    num *= 2
    print(num, '** 3 =', num ** 3)
    print(num)