n = int(input('Введите число: '))
for i in range(1, n +1):
    for j in range(1, n +1):
        if j % 3 == 0: 
            print(j, end='\t')
        else:
            print(i, end='\t')
    print()