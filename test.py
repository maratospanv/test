# total_number = int(input("Введите кол-во цифр: "))

# for numbers in range(total_number):
#     number = int(input('Введите число: '))

#     for i in range(1,number + 1):
#         j = int(input())
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
    
