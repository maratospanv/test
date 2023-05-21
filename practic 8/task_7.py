number = int(input('Введите число: '))
n = -1
for summ in range(0,number + 1):
    eleme = ((-1) ** summ * (1 / 2) ** summ)
    n += 1
    print('n =', n)
    eleme += eleme
    print(eleme)
#sum = 0
#print(int((-1) ** sum * (1 / 2) ** sum)