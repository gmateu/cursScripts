#!/bin/bash

#es mostra l'script executat
echo "Nom del script ${0}"

#mostram el PATH (RUTA) I el filename del script
echo "el PATH: $(dirname ${0}) el fitxer seria $(basename ${0})"

#per determinar el número de paràmetre
NUMERO_DE_PARAMETRES=${#}

if [[ ${NUMERO_DE_PARAMETRES} -eq 0 ]]
then
    echo "USAGE: ${0} USER_NAME [USER_NAME] ..."
    exit 1
fi

#${*} mostra el conjunt de paràmetres en una sola paraula "${1} ${2}.....${n}"
echo "${*}"
echo
#${@} mostra el conjut de paràmetres en paraules diferents "${1}" "${2}" ..... "${n}"
echo "${@}"

#estructura de control FOR per interar els paràmtres
for USER_NAME in "${@}"
do
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"
done
echo
#recorrer els paràmetres amb while
echo "ITERACIÓ AMB WHILE"
while [[ ${#} -ge 1 ]]
do
    #${1} indica el paràmtre en primera posició
    USER_NAME=${1}
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"
    shift
done







