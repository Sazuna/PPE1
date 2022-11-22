#!/bin/bash

#TODO : ecrire une ligne de commande qui prend en parametre $1
# le resultat de curl -I et afficher le code de la reponse
# (200, 404...)

RESPONSE=$1
CODE=$(head -n 1 | cut -d ' ' -f2) # on pourrait rassembler le tout dans une seule et même commande. (minus un script)
echo $CODE

# commande idéale pour récupérer code réponse HTTP (dans boucle for) : 
# (curl -I http.example.com | head -n 1 | cut -d ' ' -f2) > response_code.txt
# echo "\n" > response_code.txt