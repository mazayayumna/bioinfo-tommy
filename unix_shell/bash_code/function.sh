#!/usr/bin/env bash

function hello {
	echo "Hello, nice to meet you $1"
}

hello
hello
hello

#sum number of sequence
function addseq {
	#so that sum var accessible locally not globally
	local sum=0
	for elem in $@
	do
		let sum=sum+$elem
	done
	echo $sum
}

#multiply num of seq
function multseq {
	local kali=1
	for elem in $@
	do
		let kali=kali*$elem
	done
	echo $kali
}

#is even
function iseven {
	res=$(($1 % 2))
	if [ $res -eq 0 ]; then
		echo "1"
	else
		echo "0"
	fi
}

#n even
function neven {
	local sum=0
	#quoted for safety
	for elem in "$@"
	do
		num=$(iseven "$elem")
		if [ $num -eq 1 ]; then
			let sum=sum+1
		fi
	done
	echo $sum
}

#how to run:
#source function.sh
#hello yumne
#addseq 12 90 3
