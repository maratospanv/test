#!/bin/bash
f='file'
n=0

for i in `find /etc -type f -maxdepth 1 &1> /dev/null`
do
	echo $(cat $i | wc -l) $i
	
done

