
while True:
    number = int(input('Введите число: '))
    attempts = 0
    if (number >= 1) or (number <= 100):
        #hint = 0
        #attempts += 1
        #print(number)
        inp = ('Твое число равно, меньше или больше, чем число '+ str(number)+'? ')
        hint = int(input(inp))
        if hint == 1:
            print('равно')
            break
        if hint == 2:
            print('больше')
        if hint == 3:
            print('меньше')
        if attempts > 6:
            break
    #else:
#print('Число выходит за рамки')

