exit_code = '0550'
while True:
    print('Компьютер заблокирован. Вернёшь скейт — скажу код разблокировки!')
    user_code = (input('Введите код: '))
    if user_code == exit_code:
        print('Код верный, завершаю работу...')
        break