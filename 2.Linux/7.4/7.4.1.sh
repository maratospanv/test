#!/bin/bash
while true
do
	echo "Who are you?"
	cat << options
bunny
tux
daemon
kitty
vader-koala
quit
options
echo
read -p "Choice your variant: " option
if [ "$option" = "quit" ]
then
	break
else
	fortune | cowsay -f $option
fi
done
