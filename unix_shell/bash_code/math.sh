#!/usr/bin/env bash
# File: math.sh

#simple math
expr 5 + 2
expr 5 - 2
expr 5 \* 2 #use esc so bash didnt think this is regex
expr 5 / 2 #integer div
#big math
echo "22 / 7" | bc -l
echo "4.2 * 9.15" | bc -l
echo "(6.5 / 0.5) + (6 * 2.2)" | bc -l
