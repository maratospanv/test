scholarship = int(input('Введите стипендию: '))
expenses = int(input('Введите расходы на проживание: '))
lack_of = expenses - scholarship
print()
for mounth in range(1,11):
    if mounth > 1:
        expenses += (expenses / 100) * 3
        lack_of = expenses - scholarship + lack_of
    print(str(mounth) + '.'+'месяц траты '+str(int(expenses)), 'не хватает', str(int(lack_of)))
print()
print('Нужно попросить у родителей', int(lack_of), 'рублей')