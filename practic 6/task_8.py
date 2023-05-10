search_number = int(input('Загадайте число: '))
number = 50
#attempts = 0
answer = 0
while True:
    if (number >= 1) or (number <= 100):
        inp = ('Твое число равно, меньше или больше, чем число '+ str(number)+'? ')
        hint = int(input(inp))
        if hint == 1:
            answer = search_number
            print('равно', answer)
            break
        if hint == 2:
            answer = answer + (answer / 2)
            print('больше', answer)
            number = int(answer)
        if hint == 3:
            answer = int(number / 2)
            print('меньше', answer)
            number = int(answer)
#        if attempts > 6:
#            print('Выполнено 7 попыток подбора')
#            break
    #else:
#print('Число выходит за рамки')