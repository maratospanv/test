soldiers_num = int(input('Введите количество солдат: '))
rules_num = 150
updownsum = 0
print()
for soldiers in range(soldiers_num - 4, 0, -4):
    rules_num += 4
    if soldiers_num < 4:
        print('Солдат меньше требуемого')
        break        
    print('Солдат номер', soldiers)
    answer = int(input('Введите количество правил: '))
    if answer != rules_num:
        updown = soldiers * 10
        print('упал-отжался', updown, 'раз')
        updownsum += updown
    else:
        print('Ответ верный')
print()
print('Общее количество отжиманий:', updownsum)
