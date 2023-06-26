weather = int(input('Введите температуру: '))
meters = 0
while weather >= 15:
    meters += 20
    weather -= 2
    if weather <= 15:
        break
    meters += 10
print(meters)