#!/bin/bash
function usage(){
    echo "USAGE: ${0} USER_NAME [COMMENTS]"
    echo "COMENTS conté el nom complet"
    exit 1
}
NUMBER_PARAM=${#}
if [[ ${NUMBER_PARAM} -eq 0 ]]
then
    usage
fi
echo  "número de paràmetres: ${NUMBER_PARAM}"

#aprendrem a tractar amb els argument (com s'anomenen a fora) i paràmetres 
#com s'anomenen a dins
SCRIPT_NAME=${0}
echo "Nom del script ${SCRIPT_NAME}"
#${1}.....${9}
echo "primer paràmetre: ${1}"
USER_NAME=${1}
echo "USER_NAME: ${USER_NAME}"
#desplaçar els paràmetres a l'esquerra
shift

NOM_COMPLET=${*}
echo "NOM COMPLET: ${NOM_COMPLET}"