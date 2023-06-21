#import math

def maximum_of_two(num1, num2):
    if num1 > num2:
        return num1
    else:
        return num2

def maximum_of_three(num1,num2, num3):
    maximum_two = maximum_of_two(num1,num2)
    return maximum_of_two(maximum_two,num3)
    

num1 = int(input('Введите первое число: '))
num2 = int(input('Введите второе число: '))
num3 = int(input('Введите третье число: '))

print('Максимальное число:', maximum_of_three(num1, num2, num3))
