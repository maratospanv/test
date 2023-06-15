def positive():
    print('Положительное')

def negative():
    print('Отрицательное')

def test():
    num = int(input('Введите число: '))
    if num >= 0:
        positive()
    else:
        negative()

test()