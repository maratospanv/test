chair = int(input('Введите число: '))
chair_sum = 0
for chair_n in range(1,chair + 1,5):
    print('Номер стула:', chair_n)
    chair_sum+=chair_n
print('Сумма: ', chair_sum)