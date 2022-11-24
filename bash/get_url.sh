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
		CODE=$(./get_response_code.sh "$RESPONSE")
		CHARSET=$(./get_response_charset.sh "$RESPONSE")
		echo "$CODE,$CHARSET" > $OUTPUT_FILE
	else
		echo "$URL is not a valid url."
		continue
	fi

	if [[ $CODE -eq 200 ]]
	then
		echo "200 OK"
		DUMP=$(lynx -dump -nolist -assume_charset=$CHARSET -display_charset=$CHARSET $URL)
		if [[ $CHARSET -ne "UTF-8" && $CHARSET -ne "utf-8" && -n "$DUMP" ]]
		then
			DUMP=$(echo $DUMP | iconv -f $CHARSET -t UTF-8//IGNORE)
		fi
	else
		DUMP=""
		CHARSET=""
	fi
	OUTPUT_NUMBER=$(expr $OUTPUT_NUMBER + 1 )
done
