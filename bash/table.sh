#!/bin/bash

# CHECK ARG. NUMBER
if [[ $# -lt 1 ]]
then
	echo "Minimum one argument."
	echo "Use :"
	echo "./table.sh table.csv"
	exit 1
fi

# CREATE HTML TABLE FROM CSV FILE. (WITHOUT HEADER)
echo "<table>"
while read line; do
    echo "<tr>"
	#echo $line 
	line=$(echo $line | tr " " "@" | tr "," " " | tr -d "\r")
	#echo $line
    for item in $line 
	do
		#echo "  $item"
	item=$(echo $item | tr "@" " ")
        echo "<td>$item</td>"
	done 
	echo "</tr>"
done < $1
echo "</table>"

