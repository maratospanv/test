# symbol_count = 0
# for symbol in 'shacnidw':
#     symbol_count += 1
#     if symbol_count == 1:
#         symbol = 's'
#     if symbol_count == 2:
#         symbol = 'a'
#     if symbol_count == 3:
#         symbol = 'n'
#     if symbol_count == 4:
#         symbol = 'd'
#     if symbol_count == 5:
#         symbol = 'w'
#     if symbol_count == 7:
#         symbol = 'c'
#     if symbol_count == 8:
#         symbol = 'h'
#     print(symbol, end='')

#print(secret[0]+secret[2]+secret[4]+secret[6]+secret[7]+secret[5]+secret[3]+secret[1], end = '')


word = 'shacnidw'
new_text1 = ' '
new_text2 = ' '
count = 0

for text in word:
    count += 1
    if (count % 2 == 1):
        new_text1 += text
    else:
        new_text2 = text + new_text2

print(new_text1)
print(new_text2)
print('Расшифрованое слово', new_text1 + new_text2)


        
#print(new_word)