inp_row = int(input('Количество строк: '))
inp_col = int(input('Количество столбцов: '))
count = 0
for row in range(inp_row):
    for col in range(inp_col):
        if row == 0 and col == inp_col // 2:
            count = col
            print('#',end='')
            count -= 2
        else: 
            print(' ', end='')
    print()