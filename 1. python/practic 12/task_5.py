
def count_letters(text):
    search_num = input('Какую цифру ищем? ')
    search_sym = input('Какую букву ищем? ')
    num_count = 0
    sym_count = 0
    for nums in text:
        if nums == search_num:
            num_count += 1
    for syms in text:
        if syms.lower() == search_sym.lower():
            sym_count += 1
    print()
    print('Количество цифр', search_num+':', num_count)
    print('Количество букв ', search_sym+':', sym_count)


text = input('Введите текст: ')
count_letters(text)