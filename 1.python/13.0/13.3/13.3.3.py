
def test(number):
    num = number
    b = -1
    while number > 0:
        b += 1
        number = number // 10
    if num > 10:
        x = num * (10 ** (-b))
        print('x =',x,'* 10 **', abs(b))
    else:
        print('Число меньше 10')


number = int(input('Введите число: '))
test(number)