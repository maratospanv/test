money = int(input('Введите стартовую сумму: '))
while money < 10000:
    cube = int(input('Сколько выпало на кубике? '))
    if cube == 3:
        money = 0
        print('Вы проиграли всё!')
        break
    else:
        #money = 0
        money += 500
        print('Выиграли',money,'рублей!')
print("Игра закончена.\nИтого осталось:", money)    