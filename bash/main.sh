#!/bin/bash

# get all urls 
# for each word in each language

# FRENCH
urlsListFR=$(ls urls/presse/francais/sens_*)
./get_all_urls.sh "méli-mélo" $urlsListFR

# SPANISH
urlsListSP=$(ls urls/presse/espagnol/sens_*)
./get_all_urls.sh "batiburrillo" $urlsListSP

# CHINESE
urlsListCN=$(ls urls/presse/chinois/sens_*)
./get_all_urls.sh -n "dazahui" $urlsListCN
# -n because we want to remove spaces and \n in the context.
