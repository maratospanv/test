def numeral_count(num_count):
    j = 0
    for i in range(num_count):
        number = int(input('Введите число: '))
        if number > j:
            j = number
        elif j < 0:
            j = 0
    print('Первая задача на обработку:',j)


task_count = int(input('Введите кол-во задач: '))
numeral_count(task_count)

# num_sum = int(input('Введите кол-во задач: '))
# j = 0
# for i in range(num_sum):
#     num = int(input('Введите число: '))
#     if num > j:
#         j = num
# print('Первая задача на обработку:',j)