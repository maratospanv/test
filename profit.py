profit = int(input('Введите сумму дохода: '))
if profit < 0:
    print('Ошибка: доход не может быть отрицательным')
elif profit < 10000:
    tax = profit * 13 / 100
    print('Сумма налога с дохода ', profit, '(13%) равна', tax)
elif profit < 50000:
    tax = profit * 20 / 100
    print('Сумма налога с дохода', profit, '(20%) равна', tax)
else:
    tax = profit * 30 / 100
    print('Сумма налога с дохода ', profit, '(30%) равна', tax)