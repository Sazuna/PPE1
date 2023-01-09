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

CONCORDANCE_F="../html/content/$WORD-concordances.html"
echo "<table><thead><tr><th>Gauche</th><th>Cible</th><th>Droite</th></tr></thead><tbody>" > $CONCORDANCE_F

for FILE in $FOLDER/$WORD-*.txt
do
    while read -r LINE
    do
        LEFT=$(echo $LINE | sed -E "s/$EXPREG.*//g")
	WORD=$(echo $LINE | egrep -o "$EXPREG" | head -1)
	RIGHT=$(echo $LINE | sed -E "s/.*$EXPREG//g")
	echo "<tr><td style='text-align:right'>$LEFT</td><td style='font-weight:bold'> $WORD </td><td style='text-align:left'>$RIGHT</td></tr>" >> $CONCORDANCE_F
        #echo $LINE | sed -E "s/(.* )($EXPREG)( .*)/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><\/tr>/" >> $CONCORDANCE_F
    done < $FILE
done

echo "</tbody></table>" >> $CONCORDANCE_F
