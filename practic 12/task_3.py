def summ(num):
    num1 = (num // 10)
    num2 = (num % 10)
    num3 = num1 + num2
    print(num3)

def max(num):
    num1 = (num // 10)
    num2 = (num % 10)
    if num1 > num2:
        print('Число', num1, 'больше', num2)

def min(num):
    num1 = (num // 10)
    num2 = (num % 10)
    if num1 < num2:
        print('Число', num1, 'меньше', num2)

def quest(question):
    
    question = int(input('суммировать числа (1) \nНайти максимальное число (2)  \nНайти минимальное число (3)'))
    if question == 1:
        summ(input_num)
    elif question == 2:
        max(input_num)
    elif question == 3:
        min(input_num)
    else:
        quest()

input_num = int(input('Введите число: '))
quest(input_num)
        

