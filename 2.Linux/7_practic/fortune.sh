#!/bin/bash
file=fortune.txt
cat /dev/null > $file
i=0
a="."
while [ "$i" -le 9 ]
do
	i=$(("$i" + 1))
	word=`fortune`
	num="$i"
	j=${i}${a}${word}
	echo "$j" >> $file
	if [ $(expr "$num" % 2) -eq 0 ]
	then
		echo $j
	fi
done
