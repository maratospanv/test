def gcd(num1, num2):
    if num1 > num2:
        max_num = num1    
    else:
        max_num = num2
    for i in range(1, max_num + 1):
        if (num1 % i == 0) and (num2 % i == 0):
            gcd_num = i 
    print(gcd_num)

first_num = int(input('Введите первое число: '))
second_num = int(input('Введите второе число: '))

gcd(first_num, second_num)