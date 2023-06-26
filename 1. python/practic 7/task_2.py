wage_summ = 0
for wage in range(1,13):
    wage_on_month=int(input('Введите сумму заработной платы за '+str(wage)+' месяц: '))
    wage_summ += wage_on_month
print('Средня зарплата за год - составляет:', str(int(wage_summ / 12)))