totlHour = int(input('Введите количество часов: '))
cell = 1
for hour in range(1,totlHour // 3 + 1):
    cell *= 2
    print('Прошло часов:', hour * 3)
    print('Количество клеток:', cell)
    print('Осталось часов:', totlHour - hour  * 3)
    print()