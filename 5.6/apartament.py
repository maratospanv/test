price = int(input('Введите стоимость квартиры: '))
square = int(input('Введите площадь квартиры: '))
if (square >= 100) and (price <= 10000000) or (square >= 80) and (price <= 7000000):
    print('Квартира подходит')
else:
    print('Квартира не подходит!')