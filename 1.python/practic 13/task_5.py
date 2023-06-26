start = float(input('Введите начальную амплитуду: '))
end = float(input('Введите амплитуду остановки: '))
count = 0
while start != end:
    start -= start / 100 * 8.4
    count += 1
    if start < end:
        break

print('\nМаятник считается остановившимся через', count, 'колебаний')
