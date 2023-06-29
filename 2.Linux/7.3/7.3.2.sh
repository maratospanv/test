#!/bin/bash

while read line
do
if [ "$line" = "five" ]
then
break
fi
echo $line
done < num.txt
