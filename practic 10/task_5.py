total_number = int(input("Введите кол-во цифр: "))
max = 0

for i in range(total_number):
    j = int(input('Введите число: '))
    s = 0
    while j > 0:
        s += j % 10
        j = j // 10
    print(s)

    if max < s:
        max = s
print('MAX', max)