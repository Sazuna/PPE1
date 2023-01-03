#!/bin/bash
#
# L'objectif de ce script est de transformer le journal de bord en un objet Tiles
# (https://bulma.io/documentation/layout/tiles/)
#

JDB="../doc/journal-de-bord.md"
IS_OPEN_1="NO"
IS_OPEN_2="NO"
OUTPUT="../html/jdb.html"
STRUCT="../html/struct.html"

# On récupère l'en-tête de la page
cat $STRUCT | sed -n '/{CONTENT}/q;p'

echo "<div class=''>"

while read -r LINE; # On lit le fichier journal-de-bord.md ligne par ligne
do
	# On récupère les titres qui n'ont que deux # devant (et pas 3):
	if [[ "$LINE" =~ ^##[^#].*$ ]];
	then
		LINE=$(echo $LINE | cut -c 4-)
		if [[ $IS_OPEN_1 = "YES" ]];
		then
			echo "</p></div>"
			IS_OPEN_2="NO";
		fi
		echo "<div class=''><h2> $LINE </h2>"
		IS_OPEN_1="YES"
	elif [[ "$LINE" =~ ^###.*$ ]];
	then
		LINE=$(echo $LINE | cut -c 5-)
		echo "<h3> $LINE </h3>"
	else
		if [[ $IS_OPEN_2 = "NO" ]];
		then
			echo "<p>"
			IS_OPEN_2="YES"
		fi
		echo $LINE
	fi
done < $JDB
echo "</p></div>"

echo "</div>"

#On récupère la fin de la page
tac $STRUCT | sed -n '/{CONTENT}/q;p' | tac
