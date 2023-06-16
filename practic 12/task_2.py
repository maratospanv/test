def positive():
    print('Положительное')

def negative():
    print('Отрицательное')

def test():
    num = int(input('Введите число: '))
    if num >= 1:
        positive()
    elif num == 0:
        print('Число 0 не является ни положительным, ни отрицательным числом ')
    else:
        negative()

test()