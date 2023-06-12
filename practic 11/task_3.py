import math

size = float(input('Укажите размер файла для скачивания: '))
speed = float(input('Какова скорость вашего соединения: '))

download_size = 0
second = 0
download_percent = 0

print()

for i in range(int(size / speed) + 1):
    if size <= 0 or speed <= 0:
        print('Невозможно скачать файл')
        break
    else:    
        download_size += speed
        second += 1
        download_percent = math.ceil(download_size/(size / 100))

        if download_size > size:
             
            more_size = download_size - size
            download_size -= more_size
            more_percent = download_percent - 100
            download_percent -= more_percent
            print('Прошло', second, 'сек. Скачано', download_size, 'из', size, 'Мб', '('+str(download_percent)+'%)')
        else:
            print('Прошло', second, 'сек. Скачано', download_size, 'из', size, 'Мб', '('+str(download_percent)+'%)')

print()
print('Скачано', str(download_size)+' Мб,', 'скачивание заняло', second, 'секунд' )