number = int(input('Введите число: '))
delimiter = '-=- '
print(end = delimiter)
for ten in range(number + 1):
    if ten % 10 == 0:
        print(ten, end = ' -=- ')