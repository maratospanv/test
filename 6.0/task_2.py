name = input('Введте имя должника: ')
duty = int(input('Введите сумму долга: '))
debt_repayment = int(input('Введите сумму для погашения: '))
while debt_repayment < duty:
    print('Василий, ваша задолженность составляет', duty, 'рублей.')
    summa = int(input('Сколько рублей вы внесёте прямо сейчас, чтобы её погасить? '))
    if summa < duty:
        print('Маловато', name+'.', 'Давайте ещё раз.')
    else:
        break
print('Отлично,', name+'!', 'Вы погасили долг. Спасибо!')