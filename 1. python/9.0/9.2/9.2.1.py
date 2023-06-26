badGradeCout = 0
for question in range(5):
    answer = input('Кто написал произведение? ')
    if answer == 'Евгений Онегин':
        print('Правильно')
        break
    print('Ответ не верный. Два')
    badGradeCout += 1
print('Количество двоечгиков', badGradeCout)