total_number = int(input("Введите кол-во цифр: "))
max_sum = 0
check_num = 0
check_num2 = 0

for num in range(total_number):
    numbers = int(input('Введите число: '))
    remainder = 0
    check_num = numbers

    while numbers > 0:
        remainder += numbers % 10
        numbers = numbers // 10
    

    if max_sum < remainder:
        max_sum = remainder
        check_num2 = check_num
        
print('Максималльная сумма чисел равна', max_sum, 'для числа', check_num2)