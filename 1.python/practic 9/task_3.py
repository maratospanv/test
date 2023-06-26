ranks = int(input('Введте кол-во рядов: '))
chairs = int(input('Введте кол-во сидений в ряде: '))
between_meters = int(input('Введте кол-во метров между рядами: '))

symbol1 = '*'
symbol2 = '='
#ranks_count = ranks * symbol2
chair_count = chairs * symbol2
between_meters_count = between_meters * symbol1

print('Сцена')

for ranks_count in range(ranks):
    print(chair_count, between_meters_count, chair_count)
