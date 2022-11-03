#!/bin/bash
WORD=$1
OUTPUT_NUMBER=0

if [ ! -d $WORD ]
then
	mkdir $WORD
fi

echo "getting URLs of $2..."
for URL in $(cat $2)
do
	curl $URL > "$WORD/$OUTPUT_NUMBER.txt"
	OUTPUT_NUMBER=$(expr $OUTPUT_NUMBER + 1 )
done
