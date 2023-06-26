boys = int(input('Введите кол-во мальчиков: '))
girls = int(input('Введите кол-во девочек: '))
result = ''
if boys > 2 * girls or girls > 2 * boys:
    print('Нет решения')
elif boys > girls:
    diff = boys - girls
    for bg in range(girls - diff):
        result += 'BG'
    for bgb in range(diff):
        result += 'BGB'
else:
    diff = girls - boys
    for gb in range(boys - diff):
        result += 'GB'
    for gbg in range(diff):
        result += 'GBG'
print(result)