search_number = int(input('Введите число: '))
attempt = 0
hint = 0
number = 50
while True:
    attempt = attempt + 1
    if (search_number >= 1) or (search_number <= 100):
        answer_message = 'Ваше число больше или меньше или равно', str(number)+' ? '
        answer = int(input(answer_message))
        if attempt > 7:
            print('Количесво попыток исчерпано')
            break
        elif answer == 1:
            print('Вы нашли загаданное число', search_number)
            break
        elif answer == 2:
            print('Число больше числа', number)
            #number = (int(number) * 2) - (number // 2)
            number = number % 2
            print(number)
        elif answer == 3:
            print('Число меньше числа', number)
            number = number // 2
            print(number)




# search_number = int(input('Введите число: '))
# number = 50
# while True:
#     #Ограничение диапазона поиска
#     if (search_number >= 1) or (search_number <= 100):
#         answer_message = 'Ваше число больше или меньше или равно', str(number)+' ? '
#         answer = int(input(answer_message))
#         if answer == 1:
#             print('Вы угадали число', search_number, '!!!')
#             break
#         elif answer == 2:
#             print('Число больше числа', number)
#             number = number + (number/2)
#             print(number)
#         elif answer == 3:
#             print('Число меньше числа', number)
#             number = number // 2
#             print(number)
            


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