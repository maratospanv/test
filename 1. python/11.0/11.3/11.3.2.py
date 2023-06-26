x_coord = float(input("По горизонтали: "))
y_coord = float(input("По вертикали: "))
if 0 < x_coord < 0.8 and 0 < y_coord < 0.8:
    x_number = int(x_coord * 10)
    y_number = int(y_coord * 10)
    print("Фигура находится в клетке (", x_number, ",", y_number, ")")
else:
    print("Клетки с такой координатой не существует")