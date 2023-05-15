sharpener = 0
good = 0
excellent = 0
students = int(input('Введите количесво учеников: '))
for num_stud in range(students):
    mark = int(input('Введите оценку: '))
    if mark == 3:
        sharpener += 1
    if mark == 4:
        good += 1
    if mark == 5:
        excellent += 1
print('троечников - ', str(sharpener))
print('хорошистов - ', str(good))
print('отличников - ', str(excellent))
if sharpener > good and sharpener > excellent:
    print('Сегодня больше троечников', sharpener)
elif good > sharpener and good > excellent:
    print('Сегодня больше хорошистов', good)
elif sharpener == good:
    print('Сегодня одинаковое количество троечников и хорошистов')
elif sharpener == excellent:
    print('Сегодня одинаковое количество троечников и отличников')
elif good == excellent:
    print('Сегодня одинаковое количество хорошистов и отличников')
else:
    print('Сегодня больше отличников', excellent)