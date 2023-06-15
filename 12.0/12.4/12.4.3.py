import math

def my_distance(x, y):
    distance = math.sqrt(x ** 2 + y ** 2)
    print(distance)


def their_distance(x_1, x_2, y_1, y_2):
    distance = math.sqrt((x_2 - x_1) ** 2 + (y_2 - y_1) ** 2)
    print(distance)


user_choice = int(input("Найти расстояние от себя до точки (1) или найти расстояние между двумя произвольными точками (2)? "))
if user_choice == 1:
    target_x = float(input("Введите координату X цели: "))
    target_y = float(input("Введите координату Y цели: "))
    my_distance(target_x, target_y)
elif user_choice == 2:
    target_x_1 = float(input("Введите координату X цели 1: "))
    target_y_1 = float(input("Введите координату Y цели 1: "))
    target_x_2 = float(input("Введите координату X цели 2: "))
    target_y_2 = float(input("Введите координату Y цели 2: "))
    their_distance(target_x_1, target_x_2, target_y_1, target_y_2)
else:
    print("Ввод неверный")