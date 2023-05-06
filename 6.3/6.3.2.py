number = int(input('Введите число: '))
summ = 0
while number != 0:
    last_num = number % 10
    if last_num == 5:
        print('Найдена цифра 5')
    summ += last_num
    #number // 10
    #number % 10
print(number)