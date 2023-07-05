#!/bin/bash
read -p "Enter file or directory name: " filename
tar --remove-files -czf $filename.tar.gz $filename && mv $filename.tar.gz TRUSH/