import math

distance = int(input('Расстояние: '))
corner = int(input('Угол: '))

x = distance * math.cos(corner)
y = distance * math.sin(corner)

print(x,y)