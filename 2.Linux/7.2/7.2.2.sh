#!/bin/bash
num=1
while [ $num -le 10 ]
do
echo "$num: Hello World"
num=$(( $num + 1 ))
done
