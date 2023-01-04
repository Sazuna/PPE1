#!/bin/bash

# If there are less than two arguments
if [[ $# -lt 2 ]]
then
	echo "Minimum two argument."
	echo "Use :"
	echo "    ./concordances [WORD] [LANGUAGE]"
	exit 1
fi


CONCORDANCE_F="../generated/concordances/$WORD-concordances.html"
echo "<table><thead><tr><th>Gauche</th><th>Cible</th><th>Droite</th></tr></thead><tbody>" > $CONCORDANCE_F

WORD=$1
LANGUAGE=$2
FOLDER="../generated/contexts"
EXPREG=$(cat "../expreg/$1.txt")

for FILE in $FOLDER/$WORD-*.txt
do
    while read -r LINE
    do
        echo $LINE | sed -E "s/(.*)($EXPREG)(.*)/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><\/tr>/g" >> $CONCORDANCE_F
    done < $FILE
done

echo "</tbody></table>" >> $CONCORDANCE_F