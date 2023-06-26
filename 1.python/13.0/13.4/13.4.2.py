def eqv(num1, num2, num3):
    a = num1 + num2
    if abs (a - num3) < 1e-15:
        print('true')
    else:
        print('false')


num1 = float(input('Введите первое число: '))
num2 = float(input('Введите второе число: '))
num3 = float(input('Введите третье число: '))
eqv(num1,num2,num3)