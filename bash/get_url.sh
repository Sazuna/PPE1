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
if [ "$1" = "-n" ]
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
OUTPUT_NUMBER=1

# This is the regular expression that will be used to search for the word in the pages
EXPR_REG=$(cat "../expreg/$WORD.txt" | tr -d '\n')
if [[ ! $EXPR_REG ]]
then
	EXPR_REG=$WORD
fi

# File where we will save the Table
CSV="../generated/csv/$WORD.csv"
HTML_F="../html/content/$WORD-table.html"

echo "getting URLs of $2..."

# For every url in the file
for URL in $(cat $2)
do
	echo "getting $URL..."
	if [[ "$URL" =~ ^https?:// ]]
	then 
		CODES_F="../generated/codes/$WORD-$OUTPUT_NUMBER-head.txt"
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
		DUMP=$(w3m -cookie "$URL")
		ASPIRATION=$(curl "$URL")
		# We must create the file now so that we can tokenize it (tokenizer words with file, not raw text)
		DUMP_F="../generated/dump-texts/$WORD-$OUTPUT_NUMBER.txt"
		echo "$DUMP" > $DUMP_F
		if [[ $CHARSET -ne "UTF-8" && $CHARSET -ne "utf-8" && $CHARSET -ne "" && -n "$DUMP" ]]
		then
			DUMP=$(echo $DUMP | iconv -f $CHARSET -t UTF-8//IGNORE)
			ASPIRATION=$(echo $ASPIRATION | iconv -f $CHARSET -t UTF-8//IGNORE)
		fi
		# In some contexts, the word is cut in two lines.
		if [[ $NO_SPACES -eq 1 ]]
		then
			CONTEXT=$(./tokenize_chinese.py $DUMP_F)
			# Keep 20 words (punctuation counts as words with the Chinese tokenizer)
			CONTEXT=$(echo $CONTEXT | egrep -io "([^ ]* ){0,20}[^ ]?$EXPR_REG[^ ]?([^ ]* ){0,20}")
		else
			CONTEXT=$(echo $DUMP | tr '\n' ' '| egrep -io "([^ ]* ){0,20}$EXPR_REG( [^ ]*){0,20}")
		fi
		
	else
		DUMP=""
		CHARSET=""
		CONTEXT=""
		ASPIRATION=""
	fi

	# File names
	ASPIRATION_F="../generated/dump-html/$WORD-$OUTPUT_NUMBER.txt"
	CONTEXT_F="../generated/contexts/$WORD-$OUTPUT_NUMBER.txt"
	
	echo "$ASPIRATION" > $ASPIRATION_F
	echo "$CONTEXT" > $CONTEXT_F

	# Count of occurrences
	COUNT=$(echo $CONTEXT | tr ' ' '\n' | egrep -ci "$EXPR_REG")
	echo "count : $COUNT"
	# On écrit
	echo -e "<tr><td>$OUTPUT_NUMBER</td><td>$CODE</td><td><a href=\"$URL\">$URL</a></td><td><a href=\"$ASPIRATION_F\">HTML aspiré</a></td><td><a href=\"$DUMP_F\">Texte aspiré</a></td><td>$COUNT</td><td><a href=\"$CONTEXT_F\">Contexte</a></td></tr>" >> $HTML_F
	OUTPUT_NUMBER=$(expr $OUTPUT_NUMBER + 1 )
done
