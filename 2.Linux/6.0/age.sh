#!/bin/bash

read -p "Введите год рождения: " year
now=$(date +'%Y')
let age=now-year; echo "Сейчас вам $age лет"