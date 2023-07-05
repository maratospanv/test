#!/bin/bash
read -p "Enter script name: " script
sed '/^#!\/bin\/bash/! s/^#.*//g' $script > 'new_'$script && cat 'new_'$script