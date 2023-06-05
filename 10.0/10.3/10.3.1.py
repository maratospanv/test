x_lim = 30 #col
y_lim = 20 #row

for row in range(y_lim):
    for col in range(x_lim):
        if row == 0:
            print('-', end='')
        elif col == 0 or col == x_lim - 1:
            print('|' , end='')
        else:
            print(' ', end='')
    print()