number1 = int(input('Введите начало отрезка: '))
number2 = int(input('Введите конец отрезка: '))
step = int(input('Введите шаг: '))
for num_range in range(number2, number1 - 1, step):
    function = ((num_range ** 3) + 2 * (num_range ** 2) - 4 * num_range + 1)
    print('В точке', num_range, 'функция равна', function)


# function_2 = (((-2) ** 3) + 2 * ((-2) ** 2) - 4 * (-2) + 1)
# function_1 = (((-1) ** 3) + 2 * ((-1) ** 2) - 4 * (-1) + 1)
# function_0 = (((0) ** 3) + 2 * ((0) ** 2) - 4 * (0) + 1)
# function1 = (((1) ** 3) + 2 * ((1) ** 2) - 4 * (1) + 1)
# function2 = (((2) ** 3) + 2 * ((2) ** 2) - 4 * (2) + 1)
# print(function_2, function_1, function_0, function1, function2)