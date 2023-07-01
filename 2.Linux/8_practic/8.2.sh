#!/bin/bash
for i in $(find * /usr)
do
	test -f $i && test -x $i && echo $(ls -l $i)
done
