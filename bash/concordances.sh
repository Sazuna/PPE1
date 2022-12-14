#!/bin/bash

# input: fichier_text
# output: table (3 columns: gauche, cible, droit)

fichier_text=$1
mot=$2
URL=$3
html_concordances=$4

# "#"is the number of all the variables, if it's not equal to 2,the resule will be 错误
# if [[ $# -ne 4 ]]
# then
# 	echo "Ce programme demande exactement 4 arguments."
# 	exit
# fi

if [[ -z $mot ]]
then
  echo "le motif est vide"
  exit
fi

echo "
<!DOCTYPE html>
<html lang=\"en\">
<head>
  <meta charset=\"UTF-8\">
  <title>Concordance</title>
</head>
<body>
<table>
<thead>
  <tr>
    <th class=\"has-text-right\">Contexte droit</th>
    <th>Cible</th>
    <th class=\"has-text-left\">Contexte gauche</th>
  </tr>
</thead>
<tbody>
"

grep -E -o "(\w+\W+){0,5}\b$mot\b(\W+\w+){0,5}" $fichier_text | sed -E "s/(.*)($mot)(.*)/<tr><td>\1<\/td><td>\2<\/td><td>\3<\/td><\/tr>/" >> $html_concordances
# <th class=\"url\">URL</th>
# <td><a href=\"$URL\">$URL</a></td>
# echo $CONCORDANCES 

echo -e "
</tbody>
</table>
</body>
</html>
" >> $html_concordances

