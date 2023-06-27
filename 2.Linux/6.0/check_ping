#!/bun/bash
read -p "enter hostname: " name
ping -c2 $name 1> /dev/null 
if [ $? -eq 0 ]
then
	echo "Host ping successfully"
else
	echo "Host NOT ping"
fi
