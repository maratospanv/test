start_number = float(input("Введите число: "))
count = 0
while start_number > 10:
    count += 1
    start_number /= 10

while start_number > 0 and start_number < 1:
    count -= 1
    start_number *= 10

print(f"Формат плавающей точки: x = {round(start_number, 5)} * 10 ** {count}")