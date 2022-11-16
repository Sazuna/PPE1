#!/bin/bash

# COMM.: table.sh < url.txt 

#VÉRIFIER NB ARGUMENTS
if [[ $# -lt 2 ]]
then
	echo "Minimum two argument."
	echo "Use :"
	echo "./table.sh url.txt"
	exit 1
fi

# CRÉER TABLE HTML DEPUIS SCRIPT BASH
echo \<table\>
echo \<tr\>\<th\>COL1\<\/th\> \<th\>COL2\<\/th\> \<\/tr\>
while read line; do
    echo \<tr\>
    for item in $line; do
        echo \<td\>$item\<\/td\>
echo \<\/table\>