number = int(input('Введите число: '))
count = 0
while number > 0:
    count +=1
    number = number // 10
print ('Ответ:', count)