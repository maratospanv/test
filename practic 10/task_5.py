# total_number = int(input("Введите кол-во цифр: ")) 
# sum_rem = 0 
# amount = 0 
# this_number = 0 
# this_number_two = 0 
# for num in range (1, total_number + 1) : 
#     print("Введите", num, "число") 
#     number = int(input()) 
#     this_number = number 
#     while number > 0 : 
#         sum_rem += number % 10 
#         number //= 10 
#     if sum_rem > amount : 
#         amount = sum_rem 
#         this_number_two = this_number 
#         sum_rem = 0 
#     else: 
#         sum_rem = 0 
# print("Наибольшее по сумме цифр число", this_number_two, 'сумма', amount )

total_number = int(input("Введите кол-во цифр: "))
max_num = 0
summ = 0
num_of_sum = 0
for total in range(total_number):
    number = int(input('Введите число: '))

    for max in range(number):
        if number > max_num:
            max_num = number

print('Самое большое число', max_num)

while max_num > 0:
    num_of_sum += max_num % 10
    max_num //= 10

print('Сумма самого большого числа равна:', num_of_sum)