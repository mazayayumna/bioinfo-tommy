#!/usr/bin/env bash
# File: nested_if.sh

# HOW TO RUN: ./nested_if.sh {num}
# print number in range 4-6
num=$1

if [[ $num -gt 3 ]] && [[ $num -lt 7 ]]
then
	if [[ $num -eq 4 ]]
	then
		echo "four"
	elif [[ $num -eq 5 ]]
	then
		echo "yay its 5!"
	else
		echo "six"
	fi
else
	echo "You entered: $num, not what I was looking for"
fi
