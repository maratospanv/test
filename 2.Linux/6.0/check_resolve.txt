#!/bun/bash
read -p "enter hostname: " name
host $name 1> /dev/null 
if [ $? -eq 0 ]
then
	echo "Host resolved"
else
	echo "Host NOT resolved"
fi
