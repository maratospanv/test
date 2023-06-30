#!/bin/bash
cat /dev/null > fortune.txt
i=0
a="."
while [ "$i" -le 9 ]
do
i=$(("$i" + 1))
word=`fortune`
num="$i"
j=${i}${a}${word}
echo "$j" >> fortune.txt | /dev/null
echo
cat "$j"
done
