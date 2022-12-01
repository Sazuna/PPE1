#!/bin/bash

if [[ $# -lt 2 ]]
then
	echo "Minimum two arguments."
	echo "Use :"
	echo "    ./get_url.sh [[-n]] [WORD] [FILE]"
        echo "    -n is for the context dump: \\n will be removed and not replaced by spaces."
	exit 1
fi

# If the directories does not exist yet
./mkdirs.sh

# When we dump Chinese, there must be no space when collapsing two lines.
NO_SPACES=0
if [[ "$1" -eq "-n" ]]
then
	NO_SPACES=1
	shift # Remove one argument
fi

if [[ $# -lt 2 ]]
then
	echo "Minimum two arguments."
	echo "Use :"
	echo "	  ./get_url.sh [[--no-space]] [WORD] [FILE]"
        echo "    --no-spaces is for the context dump: \\n will be removed and not replaced by spaces."
	exit 1
fi


WORD=$1
OUTPUT_NUMBER=0

# This is the regular expression that will be used to search for the word in the pages
EXPR_REG=$(cat "../expreg/$WORD.txt" | tr -d '\n')
if [[ ! $EXPR_REG ]]
then
	EXPR_REG=$WORD
fi

CSV="../csv/$WORD.csv"

CATEGORIES="Ligne, CodeHTTP, URL, DumpHTML, DumpText, Occurrences, Context, Concordances gauche, Cible, Concordances droit"
echo $CATEGORIES > $CSV

echo "getting URLs of $2..."

# For every url in the file
for URL in $(cat $2)
do
	echo "getting $URL..."
	if [[ "$URL" =~ ^https?:// ]]
	then 
		CODES_F="../codes/$WORD-$OUTPUT_NUMBER-head.txt"
		# curl -i to get the header of the response before the body response
		# curl -I to get only the header of the response
		#curl -ILs $URL > $OUTPUT_FILE
		# tr -d "\r" corrige les erreurs d'affichage
		RESPONSE=$(curl -ILs $URL | tr -d "\r")
		CODE=$(./get_response_code.sh "$RESPONSE")
		CHARSET=$(./get_response_charset.sh "$RESPONSE")
		echo "$CODE $CHARSET" > $CODES_F
	else
		echo "$URL is not a valid url."
		continue
	fi

	if [[ $CODE -eq 200 ]]
	then
		# lynx does not work for chinese pages
		# DUMP=$(lynx -dump -nolist -assume_charset=$CHARSET -display_charset=$CHARSET $URL)
		DUMP=$(w3m -cookie $URL)
		ASPIRATION=$(curl $URL)
		if [[ $CHARSET -ne "UTF-8" && $CHARSET -ne "utf-8" && $CHARSET -ne "" && -n "$DUMP" ]]
		then
			DUMP=$(echo $DUMP | iconv -f $CHARSET -t UTF-8//IGNORE)
			ASPIRATION=$(echo $ASPIRATION | iconv -f $CHARSET -t UTF-8//IGNORE)
		fi
		# In some contexts, the word is cut in two lines.
		if [[ $NO_SPACES -eq 1 ]]
		then
			CONTEXT=$(echo $DUMP | tr -d '\n\r '| egrep -io ".{0,20}$EXPR_REG.{0,20}")
		else
			CONTEXT=$(echo $DUMP | tr '\n' ' '| egrep -io ".{0,20}$EXPR_REG.{0,20}")
		fi
		# CONCORDANCES
		CONCORDANCES=$(echo $DUMP | grep -E -o "(\w+\W+){0,5}$EXPR_REG(\W+\w+){0,5}" | sed -r "s/(.*)($EXPR_REG)(.*)/\"\1\", \"\2\", \"\3\"/")
	else
		DUMP=""
		CHARSET=""
		CONTEXT=""
		ASPIRATION=""
		CONCORDANCES=""
	fi

	# File names
	DUMP_F="../dump-texts/$WORD-$OUTPUT_NUMBER.txt"
	ASPIRATION_F="../dump-html/$WORD-$OUTPUT_NUMBER.txt"
	CONTEXT_F="../contexts/$WORD-$OUTPUT_NUMBER.txt"
	echo "$DUMP" > $DUMP_F
	echo "$ASPIRATION" > $ASPIRATION_F
	echo "$CONTEXT" > $CONTEXT_F

	# Count of occurrences
	COUNT=$(echo $CONTEXT | egrep -ci "$EXPR_REG")
	echo "count : $COUNT"
	echo "$OUTPUT_NUMBER, $CODE, <a href=\"$URL\">$URL</a>, <a href=\"$ASPIRATION_F\">HTML aspiré</a>, <a href=\"$DUMP_F\">Texte aspiré</a>, $COUNT, <a href=\"$CONTEXT_F\">Contexte</a>, $CONCORDANCES" >> $CSV
	OUTPUT_NUMBER=$(expr $OUTPUT_NUMBER + 1 )
done

# Create the HTML table from CSV
./table.sh $CSV > "../html/$WORD-table.html"
