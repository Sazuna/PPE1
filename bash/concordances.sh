#!/bin/bash

# If there are less than two arguments
if [[ $# -lt 1 ]]
then
	echo "Minimum one argument."
	echo "Use :"
	echo "    ./concordances [WORD]"
	exit 1
fi

WORD=$1
FOLDER="../generated/contexts"
EXPREG=$(cat "../expreg/$1.txt")

CONCORDANCE_F="../generated/concordances/$WORD-concordances.html"
echo "<table><thead><tr><th>Gauche</th><th>Cible</th><th>Droite</th></tr></thead><tbody>" > $CONCORDANCE_F

for FILE in $FOLDER/$WORD-*.txt
do
    while read -r LINE
    do
        echo $LINE | sed -E "s/(.*)($EXPREG)(.*)/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><\/tr>/g" >> $CONCORDANCE_F
    done < $FILE
done

echo "</tbody></table>" >> $CONCORDANCE_F
