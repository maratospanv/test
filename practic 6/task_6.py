x = int(input('Введите число вклада X: '))
y = int(input('Введите итоговую сумму Y: '))
p = int(input('Введите число процента P: '))
#Процент 1 год
#percent = (x / 100) * p
#print(percent)
#summ = x + percent
#print(summ)
#2 год
year = 0
percent = (x / 100) * p
summ = x + percent
while y > x:
    summ = ((summ / 100) * p)+summ
    print(summ)
    if summ == 465.3985:
        break

##3 год
#summ = ((summ / 100) * p)+summ
#print(summ)