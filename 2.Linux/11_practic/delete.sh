#!/bin/bash

# Find and delete
find TRUSH/ -name "*" -mtime +2 -exec rm -f {} \;
# Input filename
read -p "Enter file or directory name: " filename
# Archive and move file
symlink="symbolic link"
symname=`stat $filename| grep Size | awk '{print $8,$9}'`
findinode=`ls -li $filename | awk '{print $1}'`

if [ "$symname" = "$symlink" ]
then
	rm -f $filename
	echo "Symlynk deleted for file $filename"

elif [ `ls -li $filename | awk '{print $3}'` -ne '1' ]
then
	echo "Linked files for $filename:"
	find . -inum $findinode
	tar --remove-files -czf $filename.tar.gz $filename && mv $filename.tar.gz TRUSH/
	echo "File $filename archived and moved to TRASH directory!"
else
tar --remove-files -czf $filename.tar.gz $filename && mv $filename.tar.gz TRUSH/
fi
