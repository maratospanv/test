# for i in range(2):
#     print('start')
#     for j in range(5):
#         print(i, j)
# print('end')


for row in range(6):
    for col in range(6):
        print(row, end='\t')
        row += 2
    print()