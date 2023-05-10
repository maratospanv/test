search_number = 7
number_attempts = 0
number = int(input('Введите число: '))
number_attempts +=1
while number != 7:
    if number > search_number:
        print('Число больше, чем нужно. Попробуйте ещё раз!')
        number = int(input('Введите число: '))
        number_attempts +=1
    if number < search_number:
        print('Число меньше, чем нужно. Попробуйте ещё раз!')
        number = int(input('Введите число: '))
        number_attempts +=1
print('Вы угадали! Число попыток:', number_attempts)



# place_on_list = int(input('Введите место в списке поступающих: '))
# number_of_points = int(input('Введите количество баллов за экзамены: '))
# if place_on_list <= 10:
#     print('Поздравляем, вы поступили!')
#     if number_of_points >=290:
#         print('Бонусом вам будет начисляться стипендия')
#     else:
#         print('Но вам не хватило баллов для стипендии')
# else:
#     print('К сожалению, вы не поступили')

# ##6.2.1 OK
# number = int(input('Введите число: '))
# while number != 0:
#     number2 = int(input('Введите 2е число: '))
#     number += number2
#     print(number)
# print('Вы ввели цифру 0!')

# ##6.2.2 OK
# password = int(input('Введите пароль: '))
# while password != 235:
#     print('Неверный пароль!')
#     password = int(input('Попробуйте ещё раз: '))
# print('Пароль верный! Добро пожаловать.')

# ##6.2.2 OK
# cache = int(input('Сколько отложить денег? '))
# while cache < 500000:
#     print('Не достаточно денег на машину!')
#     newcache = int(input('Сколько отложить денег? '))
#     cache += newcache
# print('На машину денег достаточно! \n', cache)

# ##6.3.1 OK
# weather = int(input('Сколько градусов на улице: '))
# meters = 0
# while weather >= 15:
#     meters += 20
#     weather -= 2
#     if weather < 15:
#         print('На улице слишком холодно')
#         break
#     meters += 10
# print('Я пробежал', meters)

##6.3.2
# number = int(input('Введите число: '))
# summ = 0
# while number != 0:
#     last_num = number % 10
#     print(last_num)
#     if last_num == 5:
#         print('Обнаруженн разрыв')
#         break
#     #print(number)
#     summ += last_num
#     number //= 10
# print('Сумма', summ)

# numbers = int(input("Введите число: "))
# summ_of_numbers = 0
# while numbers != 0:
#     last_number = numbers % 10
#     if last_number == 5:
#         print("Обнаружен разрыв")
#         break
#     summ_of_numbers += last_number
#     numbers //= 10

# print(summ_of_numbers)

# number = int(input('Введите число: '))
# number = number // 10
# print(number)