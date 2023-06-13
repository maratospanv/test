# x_coord = float(input("По горизонтали: "))
# y_coord = float(input("По вертикали: "))

# if 0 < x_coord < 0.8 and 0 < y_coord < 0.8:
#     x_number = int(x_coord * 10)
#     y_number = int(y_coord * 10)
#     print("Фигура находится в клетке (", x_number, ",", y_number, ")")
#     # center_x = x_number / 10 + 0.05
#     # center_y = y_number / 10 + 0.05
#     # delta_x = round(center_x - x_coord, 3)
#     # delta_y = round(center_y - y_coord, 3)
#     # print("Поправьте положение фигуры на (", delta_x, ",", delta_y, ")")
# else:
#     print("Клетки с такой координатой не существует")


print('Введите местоположение коня: ')

start_x = float(input())
start_y = float(input())

#end_x = float(input())
#end_y = float(input())

start_x_num = int(start_x * 10)
start_y_num = int(start_y * 10)

print(start_x_num, start_y_num)