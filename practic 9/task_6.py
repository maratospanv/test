text = input('Ведите символы: ')
symbol_count = 0
milk_count = 0
total_milk_count = 0

for i in text:
    symbol_count += 1
    if i == 'a':
        milk_count += 2
        print(milk_count)
        milk_count += milk_count
print('всего', milk_count)
    #for total in i:
    #    total_milk_count += milk_count
        
#print(total_milk_count)
