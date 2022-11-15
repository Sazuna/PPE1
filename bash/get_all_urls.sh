#!/bin/bash

#1st argument = word
#2nd and more arguments = path/to/file/containing/urls.txt

# If there are less than two arguments
if [[ $# -lt 2 ]]
then
	echo "Minimum two argument."
	echo "Use :"
	echo "    ./get_all_urls.sh [WORD] [FILES...]"
	exit 1
fi

# WORD will be the name of the directory to store the generated data
WORD=$1

# shift removes the first argument
shift

# For every arguments after WORD
for FILE in $@
do
	if [ ! -f $FILE ]
	then
		echo "$FILE does not exist."
		echo "It should be a file containing a list of urls."
	else
		./.get_url.sh $WORD $FILE
	fi
done
