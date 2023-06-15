def contrariwise(num):
    while num > 0:
        s = num % 10
        num //= 10
        if s != 0:
            print(s, end='')
    if num == 0:
        print('\nПрограмма завершена!')

number = int(input('Введите число: '))
contrariwise(number)
