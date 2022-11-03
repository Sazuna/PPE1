#!/bin/bash

#1st argument = word
#2nd and more arguments = path/to/file/containing/urls.txt

if [[ $# -lt 1 ]]
then
	echo "Minimum two argument."
	echo "Use :"
	echo "    ./get_all_urls.sh [WORD] [FILES...]"
	exit 1
fi

WORD=$1
shift

for FILE in $@
do
	if [ ! -f $FILE ]
	then
		echo "$FILE does not exist."
	else
		./.get_url.sh $WORD $FILE
	fi
done
