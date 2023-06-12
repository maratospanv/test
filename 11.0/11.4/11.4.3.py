import math

num = float(input('Введите число: '))
print()

if num > 0 and int(num) == num:
    print('округляет вниз', math.floor(num))
    print('округляет вверх', math.ceil(num))
    print('берет модуль числа', abs(num))
    print('извлекает квадратный корень', math.sqrt(num))
    print('возводит экспоненту в степень, равную числу', math.exp(num))
    print('считает натуральный логарифм числа', math.log(num))
    print('считает логарифм числа по основанию 2', math.log2(num))
    print('считает логарифм числа по основанию 10', math.log10(num))
    print('считает синус и косинус числа', str(math.sin(num))+',', math.cos(num))
else:
    print('Вы ввели не целое число')