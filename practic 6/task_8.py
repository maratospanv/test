search_number = int(input('Введите число: '))
attempt = 0
hint = 0
number = 50
while True:
    attempt = attempt + 1
    if (search_number >= 1) or (search_number <= 100):
        answer_message = 'Ваше число больше или меньше или равно', str(number)+' ? '
        answer = int(input(answer_message))
        if attempt > 7:
            print('Количесво попыток исчерпано')
            break
        elif answer == 1:
            print('Вы нашли загаданное число', search_number)
            break
        elif answer == 2:
            print('Число больше числа', number)
            number = (int(number) * 2) - (number // 2)
            print(number)
        elif answer == 3:
            print('Число меньше числа', number)
            number = number // 2
            print(number)