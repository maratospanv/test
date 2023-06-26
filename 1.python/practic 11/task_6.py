print('Введите местоположение коня: ')
print()

start_x = float(input('Введите начальную позицию по горизонтали: '))
start_y = float(input('Введите начальную позицию по вертикали: '))

end_x = float(input('Введите конечную позицию по горизонтали: '))
end_y = float(input('Введите конечную позицию по вертикали: '))

start_x_num = int(start_x * 10)
start_y_num = int(start_y * 10)

end_x_num = int(end_x * 10)
end_y_num = int(end_y * 10)

diff_x = abs(start_x_num - end_x_num)
diff_y = abs(start_y_num - end_y_num)

print()

if diff_x == 1 and diff_y == 2 or diff_x == 2 and diff_y == 1:
    print('Конь в клетке end', start_x_num, start_y_num, 'Точка в клетке', end_x_num, end_y_num)
    print('Да, конь может ходить в эту точку.')
else:
    print('Конь в клетке', start_x_num, start_y_num, 'Точка в клетке', end_x_num, end_y_num)
    print('Нет, конь не может ходить в эту точку.')