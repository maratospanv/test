# Задача 3. Диагональная матрица
#
# Напишите программу, которая получает на вход размер квадратной матрицы и выводит на экран по такому принципу
# диагональ из единиц с левого нижнего угла до верхнего правого, ниже диагонали — двойки, выше — нули.
#
# Пример:

n = int(input("Введите размер матрицы: "))

for y in range(n):
    for x in range(n):
        buf_x = (n - 1) - y  # вспомогательное число, которое будет уменьшаться от n-1 до 0
        if buf_x > x:
            print(0, end='\t')
        elif buf_x == x:
            print(1, end='\t')
        else:
            print(2, end='\t')
    print()
