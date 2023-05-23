text = input('Введите текст: ')
count = 0
for star in text:
    count +=1
    if star == '*':
        print('Символ «*» стоит на позиции', count)