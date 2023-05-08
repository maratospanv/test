num = int(input('Введите число: '))
while num > 0:
    last_num = num % 10
    result = last_num ** 3
    print(result)
    num //= 10