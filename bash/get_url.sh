#!/bin/bash
WORD=$1
OUTPUT_NUMBER=0

# If the directory does not exist yet
if [ ! -d $WORD ]
then
	mkdir $WORD
fi

echo "getting URLs of $2..."

# For every url in the file
for URL in $(cat $2)
do
	OUTPUT_FILE=$WORD/$OUTPUT_NUMBER"_head.txt"
	# curl -i to get the header of the response before the body response
	# curl -I to get only the header of the response
	curl -I $URL > $OUTPUT_FILE
	OUTPUT_NUMBER=$(expr $OUTPUT_NUMBER + 1 )
done
