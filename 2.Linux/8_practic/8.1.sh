#!/bin/bash

for i in $(seq 10 20)
do
	echo "$i ** 2 = "$(echo $i ^ 2 | bc)
done	
