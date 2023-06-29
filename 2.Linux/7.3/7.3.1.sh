#/bin/bash

until cat read.txt &> /dev/null
do
sleep 5
echo "File not open"
done
