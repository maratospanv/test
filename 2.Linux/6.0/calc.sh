#!/bin/bash
echo "**** operation permitted (+, -, *, /, **) ****"

read -p "enter first number: " x
read -p "enter second number: " y
read -p "enter action symbol: " operator

case "$operator" in
"+") echo "$x + $y =" $(expr "$x" + "$y");;
"-") echo "$x - $y =" $(expr "$x" - "$y");;
"*") echo "$x * $y =" $(expr "$x" \* "$y");;
"**") echo "$x ** $y =" $(expr "$x" ** "$y");;
"/")if [ "$y" -eq 0 ]; then echo "Error"; else echo "$x / $y =" $(expr "$x" / "$y"); fi;;
*) echo "Unknown operation"
esac