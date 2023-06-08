total_number = int(input("Введите кол-во цифр: ")) 
sum_rem = 0 
amount = 0 
this_number = 0 
this_number_two = 0 

for num in range (1, total_number + 1) : 
    print("Введите", num, "число") 
    number = int(input()) 
    this_number = number 

    while number > 0 : 
        sum_rem += number % 10 
        number //= 10 

    if sum_rem > amount : 
        amount = sum_rem 
        this_number_two = this_number 
        sum_rem = 0 
    else: 
        sum_rem = 0 
        
print("Наибольшее по сумме цифр число", this_number_two, 'сумма', amount )