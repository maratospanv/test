#!/bin/bash
num=0
while [ "$num" -le 10 ]
do
num=$(( "$num" + 1 ))

if [ $(expr "$num" % 2) -eq 0 ]
then
    echo $num
fi
done 