people = int(input('Количество в очереди: '))
for hour in range(people + 1):
    print('Номер часа:', hour)
    for queue in range(hour, people):
        print('Номер в очереди', queue)
    print()