number = int(input('Введите число: '))
count = 0
if number == 0:
    count +=1 
while number >= 0:
    count +=1
    number = number // 10
print ('Ответ:', count)