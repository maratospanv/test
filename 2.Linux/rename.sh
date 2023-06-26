#!/bin/bash

if [ $# -ne 2 ]
then
        echo "Missing arguments, need 2 arguments!"
        exit 1
fi

if [ ! -f "$1" ]
then
        echo "File $1 is a directory"
        exit 1
fi

if  cp "$1" "$2" && rm -f "$1"
then
        echo "File $1 renamed to $2"
else
        echo "File $1 NOT renamed to $2"
fi