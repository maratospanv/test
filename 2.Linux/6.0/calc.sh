#!/bin/bash

read -p "enter first number: " x
read -p "enter second number: " y
read -p "enter action symbol: " operator

case $operator in
"+") echo "$x + $y =" $(expr "$x" + "$y");;
"-") echo "$x - $y =" $(expr "$x" - "$y");;
"*") echo "$x + $y =" $(expr "$x" \* "$y");;
"**") echo "$x + $y =" $(expr "$x" + "$y");;
"/")echo "$x / $y =" $(expr "$x" / "$y")
if [ "$y" -eq 0 ]
then
    echo "Error"
    exit 1
;;
*) echo "Unknown operation"
esac
