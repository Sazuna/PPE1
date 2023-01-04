#!/bin/bash

if [[ $# -lt 2 ]]
then
	echo "Minimum two arguments."
	echo "Use :"
	echo "	./itramer.sh <WORD> <LANGUAGE>"
	exit 1
fi

WORD=$1
LANGUAGE=$2
FOLDER="../generated/dump-texts/"
ITRAMER_F="../generated/itramer/$WORD-itramer.xml"

# Test if the folder exists
if [[ ! -d $FOLDER ]]
then
	echo "Directory $FOLDER does not exist."
	exit 1
fi

echo "<lang=\"$LANGUAGE\">" > $ITRAMER_F

for CONTEXT_F in $(ls $FOLDER/$WORD-*.txt)
do
	CONTEXT=$(basename -s .txt $CONTEXT_F)
	echo "<page=\"$CONTEXT\">" >> $ITRAMER_F
	echo "<text>" >> $ITRAMER_F

	# Get dumps et on écrit à l'intérieur de la balise text.
	CONTENT=$(cat $CONTEXT_F)
	# Il faut substituer par les caractères donnés
	# faire attention a l'ordre des substitutions: d'abord les esperluettes..
	# sinon: < => &lt; => &amp;lt;
	CONTENT=$(echo "$CONTENT" | sed 's/\&/\&amp;/g')
	CONTENT=$(echo "$CONTENT" | sed 's/</\&lt;/g')
	CONTENT=$(echo "$CONTENT" | sed 's/>/\&gt;/g')
	# dans sed, /g = de façon globalisée dans le contenu

	echo "$CONTENT" >> $ITRAMER_F

	echo "</text>" >> $ITRAMER_F
	echo "</page>" >> $ITRAMER_F
done

echo "</lang>" >> $ITRAMER_F
