def summa_n(num):
    s = 0
    for i in range(1,num+1):
        s += i
    print(s)

num = int(input('Введите число N: '))

summa_n(num)