positive_even_num = 0
for number in range(10):
    user_num = int(input('Введите число:' ))
    #num += 1
    if user_num % 2 == 0 and user_num >= 1:
        positive_even_num += 1
#    if user_num >= 1:
#        even_number += 1
print('Положительх и четных чисел', positive_even_num )