end_number = int(input("Введите верхнюю границу диапазона: "))

# Внешний цикл для итерации по строкам пирамиды
current_number = 1
for i in range(1, end_number + 1):
    # Внутренний цикл для рисования цифр в каждой строке
    for j in range(end_number - i):
        print(" ", end="")
     for k in