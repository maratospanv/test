#!/bin/bash
pwd=`pwd`
read -p "Enter file name: " file
num=0
while read line
do
num=$(( $num + 1))
echo "Line $num $line"
done < $pwd/$file
