text = input('Введите текст: ')
big_search_text = "Ы"
min_search_text = 'ы'
firstbigSymbol = 0
secondminSymbol = 0

for symbol in text:
    if symbol == big_search_text:
        firstbigSymbol += 1
    if symbol == min_search_text:
        secondminSymbol += 1

print('Больших букв Ы:', firstbigSymbol)
print('Маленьких букв Ы:', secondminSymbol)