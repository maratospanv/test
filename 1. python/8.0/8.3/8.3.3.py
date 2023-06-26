wake_up = int(input('Во сколько проснулся: '))
water = 0
colories_sum = 0
for n in range(wake_up, 23, 3):
    water += 1
    print('Пора есть: ', n, 'часов')
    colories = int(input('Сколько колорий съел: '))
    colories_sum += colories
print('Выпил', water, 'литра воды,', 'съел', colories_sum, 'колорий')

