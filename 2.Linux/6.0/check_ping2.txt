#!/bun/bash
read -p "enter hostname: " name
echo
ping -c2 -q $name | tail -2
echo
