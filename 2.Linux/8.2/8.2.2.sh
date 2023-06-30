#!/bin/bash
a=0
b='.'
for i in $(seq 1 10); do a=$(("$a" + 1)); echo $a$b`fortune` &>> test.txt; done
