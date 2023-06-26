a = int(input('Введите первое число: '))
b = int(input('Введите второе число: '))
summ = 0
count = 0
for num in range(a,b + 1):
    if num % 3 == 0:
        count += 1
        summ += num
print (summ / count)