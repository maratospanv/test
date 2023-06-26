import math

first_num = int(input('Введите первое число: '))
second_num = int(input('Введите второе число: '))

diff = first_num - second_num

max_num = first_num - diff * (diff < 0)

print(max_num)