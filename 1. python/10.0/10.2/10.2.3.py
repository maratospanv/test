for row in range(20):
    for col in range(50):
        if row == 9:
            print('-',end='')
        elif col == 25:
            print('|',end='')
        else: 
            print(' ', end='')
    print()