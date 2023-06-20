def contrariwise(num):
    a = ''
    if num == 0:
        print('\nПрограмма завершена!')
    while num > 0:
        s = num % 10
        num //= 10
        if s >= 0:
            a += str(s)
    return a

first_n = int(input("Введите первое число: "))
second_n = int(input('Введите второе число: '))





first_g = (contrariwise(first_n))
second_g = (contrariwise(second_n))
print(int(first_g))
print(int(second_g))

g_sum = int(first_g) + int(second_g)

print(g_sum)

print(contrariwise(g_sum))




# def contrariwise(num):
#     a = ''
#     if num == 0:
#         print('\nПрограмма завершена!')
#     while num > -1:
#         s = num % 10
#         num //= 10
#         if s != 0:
#             a += str(s)
#     return a

# number = int(input('Введите первое число: '))
# sum1_cont = contrariwise(number)

# number2 = int(input('Введите второе число: '))
# sum2_cont = contrariwise(number2)

# print()

# print('Первое число наоборот:', sum1_cont)
# print('Второе число наоборот:', sum2_cont)

# summ = int(sum1_cont) + int(sum2_cont)

# print('Сумма:', summ)

# print()

# summ_cont = contrariwise(sum)
# print('Сумма наоборот:', summ_cont)

# def contrariwise(num):
#     a = ''
#     for i in range(1,len(num)+1):
#         a += num[-i]
#     return a

# number1 = input('Введите первое число: ')
# number2 = input('Введите первое число: ')

# num_cont1 = (contrariwise(number1))
# num_cont2 = (contrariwise(number2))

# print()

# print('Первое число наоборот:', num_cont1)
# print('Второе число наоборот:', num_cont2)

# summ_cont = int(num_cont1) + int(num_cont2)

# print()

# print('Сумма:', summ_cont)

# print('Сумма наоборот:', contrariwise(str(summ_cont)))


