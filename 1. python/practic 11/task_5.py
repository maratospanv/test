import math

R = float(input('Введите радиус случайной планеты: '))
v_earth = 1.08321 * 10 ** 12
v = (4 / 3) * math.pi * (R ** 3)

if v_earth > v:
    print('Объём планеты Земля больше в', round(v_earth / v, 3), 'раз')
else:
    print('Объём планеты Земля меньше в ', round(v / v_earth, 3), 'раз')