# x_lim = 10 #col
# y_lim = 5 #row

# for row in range(y_lim):
#     for col in range(x_lim):
#         if row == 0:
#             print('-', end='')
#         elif col == 0 or col == x_lim - 1:
#             print('|' , end='')
#         else:
#             print(' ', end='')
#     print()


x_lim = 10 #col
y_lim = 5 #row

pipe = int(input('Введите количество | символов: '))
dash = int(input('Введите количество - символов: '))

for row in range(pipe):
    for col in range(dash):
        if row == 0:
            print('-', end='')
        elif row == pipe - 1:
            print('-', end='')
        elif col == 0 or col == dash - 1:
            print('|' , end='')
        else:
             print(' ', end='')
    print()