text = input('Ведите символы: ')
symbol_count = 0
milk_count = 0
total_milk_count = 0
busy = 0
total = 20

for i in text:
    symbol_count += 1
    if i == 'b':
        busy += 1
        milk_count += 2
        
print('Будет произведено молока в день:', milk_count, 'л.')
print('Занято стойл:', busy, 'Свободно стойл:', total - busy)
