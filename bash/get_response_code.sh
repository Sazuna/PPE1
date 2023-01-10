#!/bin/bash

if [[ $# != 1 ]]
then
	echo "One argument required."
	echo "	Use: ./get_response_code.sh [RESPONSE]"
	exit
fi

RESPONSE=$1

# commande qui recupère le code HTTP de la réponse
echo $RESPONSE | egrep -o "^HTTP/.* [0-9]+" | tail -n 1 | cut -d' ' -f2
