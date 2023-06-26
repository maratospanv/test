import math

def sphereArea(R):
    print('Объём планеты равен', 4 * math.pi * R ** 2)
def sphereVolume(R):
    print('Площадь планеты равна', 4/3 * math.pi * R ** 3)

Radius = float(input('Введите радиус планеты: '))
sphereArea(Radius)
sphereVolume(Radius)

