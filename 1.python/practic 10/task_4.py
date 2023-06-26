seq_num = int(input('Введите количество чисел: '))
count = 0

for num in range(seq_num):
    number = int(input('Введите число: '))

    for i in range(1,number):
        flag=True
        check_simple = number - 1

        while check_simple > 1:
            if number % check_simple == 0:
                flag = False
                break
            check_simple -= 1

        if flag:
            #print(number, '- простое число')
            count += 1
            break
print('Простых чисел в последовательности', count)