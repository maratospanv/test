start = int(input('Введите число a: '))
stop = int(input('Введите число b: '))
step = int(input('Введите число c: '))
number_sum = 0
iterac = 0
for numbers in range(start,stop + 1):
    if numbers % step == 0:
        number_sum += numbers
        iterac += 1
print('Арифметическое всех чисел из отрезка', start, 'и', stop, 'кратных числу', step, 'равна:', number_sum // iterac)