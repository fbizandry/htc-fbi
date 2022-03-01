#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("Ouvrir vi" "afficher la date" "Quitter")
select opt in "${options[@]}"
do
    case $opt in
        "Ouvrir vi")
            vi
            ;;
        "afficher la date")
            date
            ;;
        "Quitter")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done