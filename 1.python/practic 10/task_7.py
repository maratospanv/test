num = int(input('Введите количество уровней пирамиды: '))
start_number = 1

for row in range(1, num+1):
  print('\t' * (num - row), end = '')
  for col in range(row):
    print(start_number, end = '')
    start_number += 2
    print('\t' * 2, end = '')
  print()