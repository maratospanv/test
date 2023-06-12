import math

size = float(input('Укажите размер файла для скачивания: '))
speed = float(input('Какова скорость вашего соединения: '))

download_size = 0
second = 0
download_percent = 0

for i in range(int(size / speed)):
    if size <= 0 or speed <= 0:
        print('Невозможно скачать файл')
        break
    else:
        download_size += speed
        second += 1
        download_percent = math.ceil(download_size/(size / 100))
        print('Прошло', second, 'сек. Скачано', download_size, 'из', size, 'Мб', '('+str(download_percent)+'%)')

print('Скачано', str(download_size)+' Мб,', 'скачивание заняло', second, 'секунд' )