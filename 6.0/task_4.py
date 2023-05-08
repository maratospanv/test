negative_count = 0
positive_count = 0
while True:
    evaluation = int(input('Введите число: '))
    if evaluation == 0:
        break
    if evaluation >= -100 and evaluation < 0:
        negative_count += 1
    if evaluation <= 100 and evaluation > 0:
        positive_count += 1
print('Кол-во положительных чисел: ', positive_count)
print('Кол-во отрицательных чисел: ', negative_count)