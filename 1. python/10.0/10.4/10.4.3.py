# Задача 3. Лестница чисел
#
# Пользователь вводит число N. Напишите программу, которая по этому числу выводит вот такую лестницу из чисел:

n = int(input("Введите число: "))
for start in range(n + 1):
    for number in range(start, n + 1):
        print(number, end='\t')
    print()