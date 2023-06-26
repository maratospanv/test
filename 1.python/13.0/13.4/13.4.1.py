def tax_exch(tax, newtax):
    if tax + newtax > tax:
        print('Результат: Бюджет увеличится')
    else:
        print('Результат: Бюджет не изменится')


tax = float(input('Введите бюджет страны: '))
new_tax = float(input('Новые поступления (налог): '))

tax_exch(tax, new_tax)