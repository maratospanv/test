#!/bin/bash

archtype() {
        sed -e 's/.*\.//'
        }

read -p "Enter archive name: " archname
if [ `ls $archname | archtype`  == 'gz' ]
then
        if [ `ls $archname | sed -r 's/.*(.{6})/\1/g'` == 'tar.gz' ]
        then
                tar xzf $archname
        else
                gunzip $archname
        fi

elif [ `ls $archname | archtype`  == 'xz' ]
then
        tar xJf $archname

elif [ `ls $archname | archtype`  == 'zip' ]
then
        if [ `dpkg -l | grep unzip | awk '{print $1}'` != "ii" ]
        then
                echo "Unzip archiver NOT installed!!!"
                echo "Please run command - sudo apt get install unzip"
        else
                unzip $archname
        fi

elif [ `ls $archname | archtype`  == 'bz2' ]
then
        bunzip2 $archname
elif [ `ls $archname | archtype`  == 'lzma' ]
then
        unlzma $archname
fi