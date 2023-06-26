#!/bin/bash
#find /home/marat/Pictures/ -name "*.jpg" -exec mv {} /home/marat/Pictures/ \;
#find /home/marat/Downloads/ -name "*.???x" -exec mv {} /home/marat/Documents/ \;


if [ $# -ne 2 ]
then
	echo "2 argument are need"
	exit 1
fi

if [ ! -d "$1" ]
then
	echo "Error $1 does not exist or not a directory"
	exit 1
fi

if [ ! -d "$2" ]
then
        echo "Error $2 does not exist or not a directory"
	exit 1
fi

if cp -r "$1" "$2" && rm -rf "$1"
then
	echo "Directory $1 was moved to $2"
	exit 0
else
	echo "Error!"
	exit 1
fi
