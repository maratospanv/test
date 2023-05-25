text = input('Введите текст: ')
total_symbols = 0 # Количество символов всего
word_symbols = 0 # Количество символов до символа разделителя
word_symbols_max = 0 # Максимальное количество символов в слове до символа разделителя
delimetr = ' '  # Разделитель
delimetr_count = 0 # Количество разделителей

for index in text:
    total_symbols += 1
print(total_symbols)

for num_index in range(total_symbols):
    if text[num_index] == delimetr:
        delimetr_count += 1
        if word_symbols_max < word_symbols:
            word_symbols_max = word_symbols
            word_symbols = 0
    else:
        word_symbols += 1
print('Количество пробелов равно:', delimetr_count)
print('Самое длинное слово,', word_symbols_max, 'букв')