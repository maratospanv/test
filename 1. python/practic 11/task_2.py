import math

numbers_count = int(input('Введите кол-во чисел: '))
print()

for nums in range(numbers_count):
    number = float(input('Введите число: '))
    
    if number > 0:
        log = math.ceil(number)
        print('x = ' + str(log),'log(x) =', math.log(log))
    elif number < 0:
        log = math.floor(number)
        print('x = ' + str(log),'exp(x) =', math.exp(log))
    print()