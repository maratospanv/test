#test
print('Начался восьмичасовой рабочий день.')
completed_task = 0
time = 0
go_shop = 0
while time <= 7:
        time += 1
        print(str(time)+'-й', 'час')
        tasks = int(input('Сколько задач решит Максим? '))
        wife_call = int(input('Звонит жена. Взять трубку? '))
        completed_task += tasks
        if wife_call == 1:
            go_shop = 1
print('Рабочий день закончился. Всего выполнено задач:', completed_task)
if go_shop == 1:
      print('Нужно зайти в магазин')