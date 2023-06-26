west_east_coord = 8
north_south_coord = 10
print('[Программа]: Марсоход находится на позиции', str(west_east_coord)+',', str(north_south_coord)+',', 'введите команду:')
while True:
    inp = input('[Оператор]: ')
    
    if inp == 'A': # or inp == 'a':
        west_east_coord -= 1
    if inp == 'D': # or inp == 'd':
       west_east_coord += 1
    if west_east_coord == -1:
       print('[Программа]: Идти дальше некуда, верьнитесь назад')
       west_east_coord += 1
    if west_east_coord == 17:
       print('[Программа]: Идти дальше некуда, верьнитесь назад')
       west_east_coord -= 1

    if inp == 'W': # or inp == 'w':
        north_south_coord -= 1
    if inp == 'S': # or inp == 's':
        north_south_coord += 1
    if north_south_coord == -1:
        print('[Программа]: Идти дальше некуда, верьнитесь назад')
        north_south_coord += 1
    if north_south_coord == 21:
        print('[Программа]: Идти дальше некуда, верьнитесь назад')
        north_south_coord -= 1

    print('[Программа]: Марсоход находится на позиции', str(west_east_coord)+',', str(north_south_coord)+',', 'введите команду:')
