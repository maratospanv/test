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
if [ $(expr "$num" % 2) -eq 0 ]
then
    echo "$j" >> fortune.txt | /dev/null
fi
echo
cat "$j"
done
