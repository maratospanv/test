# Запрашиваем у пользователя высоту пирамиды
height = int(input("Введите высоту пирамиды: "))

# Внешний цикл для итерации по строкам пирамиды
for i in range(height):
    # Внутренний цикл для рисования символов в каждой строке
    for j in range(height - i - 1):
        print(" ", end="")
    for k in range(2 * i + 1):
        print("#", end="")
    print()