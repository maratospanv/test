#days_on_year = 365
vklad = int(input('Введите сумму вклада: '))
percent = int(input('Введите процент по вкладу: '))
plan = int(input('Введите планируемую сумму накопления: '))
bank = 0
attempt = 0
percent = (percent/100)
while bank < plan:
    attempt += 1
    perc_vklad = int((vklad * percent))
    vklad = int(perc_vklad + vklad)
    bank = vklad
if attempt <= 2 or attempt <= 4:
     print('Понадобиться', attempt, 'года')
     print('За', attempt, 'года накопите', bank)
elif attempt <= 5 or attempt <= 19:
     print('Понадобиться', attempt, 'лет')
     print('За', attempt, 'лет накопите', bank)