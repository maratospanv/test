number = int(input('Введите N: '))
s = 0
for n in range(0,number):
    elem = (-1) ** n * (1 / 2) ** n
    s += elem
print('Ответ', s)