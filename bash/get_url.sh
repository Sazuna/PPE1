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
	echo "getting $URL..."
	if [[ "$URL" =~ ^https?:// ]]
	then 
		OUTPUT_FILE=$WORD/$OUTPUT_NUMBER"_head.txt"
		# curl -i to get the header of the response before the body response
		# curl -I to get only the header of the response
		#curl -ILs $URL > $OUTPUT_FILE
		# tr -d "\r" corrige les erreurs d'affichage
		RESPONSE=$(curl -ILs $URL | tr -d "\r")
		#echo $a
		CODE=$(./get_response_code.sh "$RESPONSE")
		CHARSET=$(./get_charset_code.sh "$RESPONSE")
		echo "$CODE,$CHARSET" > $OUTPUT_FILE
	else
		echo "$URL is not a valid url."
	fi

	if [[ $CODE -eq 200 ]]
	then
		echo "200 OK"
	fi
	OUTPUT_NUMBER=$(expr $OUTPUT_NUMBER + 1 )
done
