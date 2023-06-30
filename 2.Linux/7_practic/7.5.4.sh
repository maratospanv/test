#!/bin/bash
num=0
while [ $num -le 2 ]
do
sleep 120 
mkdir /tmp/directory-`date +'%Y%m%d_%H%M'`
num=$(( $num + 1 ))
done
