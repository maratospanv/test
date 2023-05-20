buckwheat_total = 100
mounth = 0
for buckwheat_count in range(buckwheat_total - 4, -1, -4):
    #print(buckwheat_count)
    mounth += 1
    print('Месяц', mounth)
    print('Останеться в следуещем месяце:', buckwheat_count, 'киллограммов')
print('У Вас закончилась гречка')
