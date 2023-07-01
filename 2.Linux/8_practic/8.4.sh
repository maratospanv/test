#!/bin/bash
f='file'
n=0

for i in `find * /etc -type f -maxdepth 1`
do
	echo $(cat $i | wc -l) $i
	
done

