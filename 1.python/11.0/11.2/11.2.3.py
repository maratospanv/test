weight = float(input('Вес тела: '))
height = float(input('Рост тела: '))

massindex = round(weight / height ** 2, 2)

print('Ваш индекс массы тела равен:', massindex)

if massindex < 18.5:
    print('недобор')
elif massindex < 25:
    print('всё нормально')
elif massindex < 30:
    print('идёт избыток')
else:
    print('ожирение')