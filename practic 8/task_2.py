debtors_count = int(input('Введите количество должников: '))
debt_sum = 0
for debetor in range(0, debtors_count, 5):
    print('Должник с номером', debetor)
    debt_amount = int(input('Сколько должны? '))
    debt_sum += debt_amount
print('Общая сумма долга:', debt_sum)

