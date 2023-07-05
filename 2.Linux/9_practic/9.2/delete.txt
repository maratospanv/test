#!/bin/bash
find ~/TRUSH -name "*" -mtime +2 -exec rm -f {} \;
read -p "Enter file or directory name: " filename
tar --remove-files -czf $filename.tar.gz $filename && mv $filename.tar.gz TRUSH/