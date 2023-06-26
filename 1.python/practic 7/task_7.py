remaining_number = 0
sum_card = 0
number  = int(input('Введите количество карточек: '))
#Сумма всех карт
for card in range(1,number+1):
    sum_card += card

# Сумма введенных карт
for find in range(number -1):
    remaining_number += int(input('Введите номер оставшейся карточки: '))

# Вывод пропавшей карты
print('Номер пропавшей карточки:', sum_card - remaining_number)