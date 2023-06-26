time = int(input('Введите время в часах: '))
if (time <= 8) and (time >= 22):
    if ((time >= 10) and (time <= 12 ) or (time >= 14) or (time <= 15) or (time >= 18) and (time <= 20)):
        print('Посылку получить нельзя!')
    else:
        print ('Можно получить посылку')
else:
    print('Посылку получить нельзя!')