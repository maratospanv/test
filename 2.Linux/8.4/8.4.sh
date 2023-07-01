#!/bin/bash
echo "**** operation permitted (+, -, *, /, ^) ****"

read -p "enter first number: " x
read -p "enter second number: " y
read -p "enter action symbol: " operator

plus() {
	echo $1 + $2 | bc
}

minus() {
	echo $1 - $2 | bc
}

umnozh() {
        echo $1 * $2 | bc
}

delenie() {
        echo $1 / $2 | bc
}

stepen() {
        echo $1 ^ $2 | bc
}
case "$operator" in
#"+") echo "$x + $y =" $(expr "$x" + "$y");;
"+") echo "$x + $y =" $(plus $x $y);;
#-") echo "$x - $y =" $(expr "$x" - "$y");;
"-") echo "$x - $y =" $(minus $x $y);;
#"*") echo "$x * $y =" $(expr "$x" \* "$y");;
"*") echo "$x * $y =" $(umnozh $x $y);;
"^") echo "$x ^ $y =" $(stepen $x $y);;
"/")if [ "$y" -eq 0 ]; then echo "Error"; else echo "$x / $y =" $(delenie $x $y); fi;;
*) echo "Unknown operation"
esac
