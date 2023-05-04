numberprint1 = int(input('Введите первое число: '))
numberprint2 = int(input('Введите второе число: '))
numberprint3 = int(input('Введите третье число: '))
if (numberprint1 == numberprint2) and (numberprint1 == numberprint3) and (numberprint2 == numberprint3):
    print('3')
elif (numberprint1 == numberprint2) or (numberprint1 == numberprint3) or (numberprint2 == numberprint3):
    print('2')
else:
    print(0)