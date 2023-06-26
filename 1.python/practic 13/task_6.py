# def formula(x):
#     return x ** 3 - 3* x ** 2 - 12 * x + 10
#     #print(abs(d))

# def div(inp):
#     min_depth = 0
#     max_depth = 4
#     result = (min_depth + max_depth) / 2
    
#     while abs(formula(result)) >= inp:
#         if abs(formula(min_depth)) < abs(formula(max_depth)):
#             max_depth = result
#         else:
#             min_depth = result
        
#         result = (min_depth + max_depth) / 2
    
#     return result



# inp = float(input('Number: '))
# result = div(inp)
# print(result)

def danger_level(x):
    return x**3 - 3*x**2 - 12*x + 10

def find_safe_depth(max_deviation):
    epsilon = 0.0001  # Маленькое число для определения точности
    lower_bound = 0.0
    upper_bound = 4.0

    while upper_bound - lower_bound > epsilon:
        mid = (lower_bound + upper_bound) / 2
        if danger_level(mid) <= max_deviation:
            upper_bound = mid
        else:
            lower_bound = mid

    return (lower_bound + upper_bound) / 2

# Запрос ввода максимального допустимого уровня опасности
max_deviation = float(input("Введите максимально допустимый уровень опасности: "))

# Поиск безопасной глубины
safe_depth = find_safe_depth(max_deviation)

# Вывод результата
print("Приблизительная глубина безопасной кладки:", safe_depth, "м")