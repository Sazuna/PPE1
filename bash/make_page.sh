#!/bin/bash

if [[ $# != 2 ]]
then
	echo "Two argument required."
	echo "	Use: ./make_page.sh [INPUT_HTML] [OUTPUT_HTML]"
	exit
fi

INPUT_HTML=$1 # The content of the page
OUTPUT_HTML=$2 # The result page
STRUCT="../html/struct.html"

if [[ ! -f $INPUT_HTML ]]
then
	echo "$INPUT_HTML does not exist."
	exit
fi

if [[ ! -f $STRUCT ]]
then
	echo "$STRUCT does not exist."
	exit
fi

# On récupère l'en-tête de la page, la barre de navigation etc
cat $STRUCT | sed -n '/{CONTENT}/q;p' > $OUTPUT_HTML

# On récupère le contenu à injecter dans la page
cat $INPUT_HTML >> $OUTPUT_HTML

# On récupère le pied de la page
tac $STRUCT | sed -n '/{CONTENT}/q;p' | tac >> $OUTPUT_HTML
