

first_num = int(input('Введите первое число: '))
second_num = int(input('Введите второе число: '))

#while first_num != 0 or second_num != 0:
if first_num > second_num:
    max_div = first_num
else:
    max_div = second_num
for i in range(1, max_div + 1):
    if (first_num % i == 0) and (second_num % i == 0):
        gcd = i
print(gcd)
