#!/usr/bin/env bash

#make a list
plagues=(blood frogs lice flies sickness boils hail locusts darkness death)

#print first index
echo ${plagues[0]}

#print all elem
echo ${plagues[*]}

#print all, start from, how much
echo ${plagues[*]:8:2}

#print length of array
echo ${#plagues[*]}

#add new elem to array
dwarfs=(grumpy sleepy sneezy doc)
echo ${dwarfs[*]}
dwarfs+=(bashful dopey happy)
echo ${dwarfs[*]}

#braces {..}
echo {0..9}
echo {a..e}
echo b{0..4}c
echo {1..3}{a..c}
echo {{1..3},{1..c}}
echo {who,what,why,when,how}?
