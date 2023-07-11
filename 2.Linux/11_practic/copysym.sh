#!/bin/bash
read -p "Enter file or directory name for copy: " symlink
read -p "Enter new file name to copy: " fromsymlink
fsymlink="symbolic link"
symname=`stat $symlink | grep Size | awk '{print $8,$9}'`

if [ "$symname" = "$fsymlink" ]
then
	cp $symlink $fromsymlink
	if [ "`test -f $fromsymlink && echo "$fromsymlink exists." || echo "$fromsymlink not exists."`" = "$fromsymlink exists." ]
	then
		rm -f $symlink
		mv $fromsymlink $symlink
	fi
else
	echo "File is not symlink"
fi

