#!/bin/bash

# Вводим три числа
read -p "Введите первое число: " num1
read -p "Введите второе число: " num2
read -p "Введите третье число: " num3

# Сравниваем числа и находим наибольшее
max=$num1
if ((num2 > max)); then
    max=$num2
fi
if ((num3 > max)); then
    max=$num3
fi

# Выводим результат
echo "Наибольшее число: $max"
