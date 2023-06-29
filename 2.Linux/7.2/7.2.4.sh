#!/bin/bash

filenum=1
while [ $filenum -le 10 ]
do 
mkdir dir$filenum
touch file$filenum
filenum=$(( $filenum + 1 ))
done
