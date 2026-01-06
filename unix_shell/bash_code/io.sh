#!/usr/bin/env bash

chapter_number=5
echo $chapter_number

#modify variabel
let chapter_number=$chapter_number+1
echo $chapter_number

the_empire_state="New York"
echo "I went to school $the_empire_state"

#command substution
math_lines=$(cat math.sh | wc -l)
echo $math_lines

echo "script args: $@"
echo "first arg: $1. second arg: $2"
echo "number of arg: $#"

echo "Type in a string then press Enter:"
read response
echo "You entered: $response"
