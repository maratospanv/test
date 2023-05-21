reverse_timer = int(input('Введите количество секунд: '))
for timer in range(reverse_timer, -1, -1):
    print(timer)
    question = int(input('Остановить таймер? '))
    if question == 1:
        print('Ваша еда готова, можете забрать')
        print('Остановлен на', timer - 1, 'секунде')
        break
    if timer == 0:
        print('Ваша еда готова, осторожно горячo!')