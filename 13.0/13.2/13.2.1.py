# num = int(input('Введите число: '))
# a = 0
# for i in range(1,num+1):
#     a += i
# print(a)

def summ_n(number):
    a = 0
    for n in range(1, number + 1):
        a += n
    print('Сумма от 1 до', number, '=', a)
    return a

num = int(input('Введите число: '))

summ = summ_n(num)
new_sum = summ_n(summ)