def summ(num):
    summ = 0
    while num >= 1:
        s = num % 10
        num = num // 10
        summ += s
    print('Сумма чисел равна:', summ)

def max(num):
    max_num = 0
    while num >= 1:
        s = num % 10
        num = num // 10
        if s > max_num or max_num == 0:
            max_num = s
    print('Максимальное число:', max_num)

def min(num):
    min_sum = 9  
    while num >= 1:
        s = num % 10
        num = num // 10
        if s < min_sum:
            min_sum = s
        #else:
        #    break
    print('Минимальное число:', min_sum)    

def quest(question):    
    question = int(input('Суммировать числа (1) \nНайти максимальное число (2)  \nНайти минимальное число (3) \n'))
    if question == 1:
        summ(input_num)
    elif question == 2:
        max(input_num)
    elif question == 3:
        min(input_num)
    else:
        quest()

while True:
    print()
    input_num = int(input('Введите число: '))
    quest(input_num)
        

