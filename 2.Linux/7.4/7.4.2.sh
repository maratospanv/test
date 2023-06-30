#!/bin/bash
i=1
until ls -la | grep file.txt &> /dev/null
do 
sleep 5
mv file file.txt
echo $((i + 1))
done
