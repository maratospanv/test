count = 0
for tickets in 345,19,87,1020,421:
        #if tickets % 5 == 0:
        if (99 < tickets and 1000 > tickets) and tickets % 5 == 0:
                print('Выигрыйшный билет- ', tickets)
                count += 1
print("Количество победителей -", count)