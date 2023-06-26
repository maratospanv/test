import random

def rock_paper_scissors():
  rock = 1
  paper = 2
  scissors = 3
  print('1 - Камень \n2 - Бумага \n3 - Ножницы \n0 - Выход в основное меню')
  user = int(input('Введите инструмент: '))
  print()
  comp = random.randint(1, 3)

  if user == 0:
    mainMenu()
  if (comp == rock and user == rock) or (comp == paper and user == paper) and (comp == 3 and user == scissors):
    print('Ничья')
    print('Пользователь выбрал', user, '\nКомпьютер выбрал', comp)
    print()
  elif (comp == paper and user == rock) or (comp == rock and user == scissors) or (comp == scissors and user == paper):
    print('Выиграл компьютер')
    print('Пользователь выбрал', user, '\nКомпьютер выбрал', comp)
    print()
  elif (comp == scissors and user == rock) or (comp == rock and user == rock) or (comp == paper and user == scissors):
    print('Выиграл Пользователь')
    print('Пользователь выбрал', user, '\nКомпьютер выбрал', comp)
    print()


def guess_the_number():
  print()
  secret = 852
  num = int(input('Угадай число: '))
  while num != secret:
    if num == 0:
      print('Вы вышли из игры')
      mainMenu()
    print('Вы не угадали число')
    print()
    num = int(input('Угадай число: '))
  print('Поздравляем!!! Вы угадали число')
  print()
  mainMenu()


def mainMenu():
  print('1. Камень - ножницы - бумага')
  print('2. Угадай число')
  print('0. Выход')
  game = int(input('В какую игру будем играть? '))
  if game == 1:
    rock_paper_scissors()
  elif game == 2:
    guess_the_number()
  elif game == 0:
    print('До свидания!')
    return
  else:
    print()
    print('Вы не корректно выбрали игру')
    print()
    mainMenu()


mainMenu()


