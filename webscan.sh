#!/bin/bash

if [ -z "$1" ]
then
        echo -e "\e[33m[+] Uso:\e[0m \e[32m./webscan\e[0m \e[33m+\e[0m \e[31m{IP}\e[0m"
        exit 1
fi

echo -e  "\e[31m[+] Buscando directorios...\e[0m"
gobuster dir -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -qz > directorios

echo -e "\e[31m[+] Analizando web...\e[om"
whatweb $1 -v > webinfo

if [ -e directorios ]
then
printf "\e[32m\n-----DIRECTORIOS----\n\n\e[0m" >> resultadosWEB
cat directorios >> resultadosWEB
rm directorios
fi

if [[ -e webinfo ]]
then
printf "\e[32m\n----WEB-INFO----\n\n\e[0m" >> resultadosWEB
cat webinfo >> resultadosWEB
rm webinfo
fi

cat resultadosWEB
