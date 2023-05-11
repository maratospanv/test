search_number = int(input('Введите искомое число: '))
attempt = 0
min = 1
max = 100
avarage = max // 2
while True:
    attempt = attempt + 1
    if (search_number >= 1) or (search_number <= 100):
        answer_message = 'Ваше число больше или меньше или равно', str(avarage)+' ? '
        answer = int(input(answer_message))
        if attempt > 7:
            print('Количесво попыток исчерпано')
            break
        if answer == 1:
            print('Вы нашли загаданное число', avarage)
            print('Число попыток:', attempt)
            break
        if answer == 2:
            min = avarage
            avarage = (max + avarage) // 2
        if answer == 3:
            max = avarage
            avarage = (min + max) // 2