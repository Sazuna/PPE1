#!/bin/bash

# get all urls 
# for each word in each language

FRENCH
urlsListFR=$(ls ../url/presse/francais/sens*)
./get_all_urls.sh "méli-mélo" $urlsListFR

# # SPANISH
# urlsListSP=$(ls ../url/presse/espagnol/batiburrillo/sens_propre.txt)
# ./get_all_urls.sh "batiburrillo" $urlsListSP

# # # CHINESE
# # urlsListCN=$(ls ../url/presse/chinois/dazahui/sens_*)
# # ./get_all_urls.sh -n "dazahui" $urlsListCN
# # -n because we want to remove spaces and \n in the context.
