def gcd(num1, num2):
    if num1 > num2:
        max_divider = num1
    else:
        max_divider = num2
    for i in range(1, max_divider + 1):
        if (num1 % i == 0) and (num2 % i == 0):
            gcd = i
    print(gcd)
    

number1 = int(input('Введите первое число: '))
number2 = int(input('Введите второе число: '))
gcd(number1, number2)