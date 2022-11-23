#!/bin/bash

RESPONSE=$1

# commande qui recupère le charset de la reponse
echo $RESPONSE | egrep -o "charset=(\w|-)+" | cut -d= -f2
