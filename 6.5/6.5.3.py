bags = int(input('Сколько мшков: '))
bags_weight = 0
bags_count = 0
while bags_count < bags:
    weight = int(input('вес мешка: '))
    bags_weight += weight
    bags_count +=1
print('Общий вес ', bags_weight)
