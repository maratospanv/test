search_number = 7
number_attempts = 0
number = int(input('Введите число: '))
number_attempts += 1
while number != 7:
    if number > search_number:
        print('Число больше, чем нужно. Попробуйте ещё раз!')
        number = int(input('Введите число: '))
        number_attempts += 1
    if number < search_number:
        print('Число меньше, чем нужно. Попробуйте ещё раз!')
        number = int(input('Введите число: '))
        number_attempts += 1
print('Вы угадали! Число попыток:', number_attempts)