money = int(input('Сколько отложить денег? '))
while money < 500000:
    money2 = int(input('Сколько eще отложить денег? В копилке не достаточно средств! '))
    money +=money2
print('В копилке достсточно средств!')
print('Вы накопили', money)
