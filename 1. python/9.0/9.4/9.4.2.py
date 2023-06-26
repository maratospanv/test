octet = int(input('Введите число: '))
summ = 0
for ip in range(3):
    octet += 3
    print(octet, end = '.')
    summ += octet 
print(summ)