# Задача 2. Цифры больше пяти
#
# Пользователь вводит последовательность из N чисел. Напишите программу,
# которая подсчитывает общее количество цифр больше пяти во всей последовательности.

n = int(input("Количество чисел в последовательности: "))
cipher_count = 0
for _ in range(n):
    new_number = int(input("Введите число: "))
    while new_number:
        if new_number % 10 > 5:
            cipher_count += 1
        new_number //= 10

print(cipher_count)