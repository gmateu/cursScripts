#!/bin/bash
function usage(){
    echo "Usage ${0} USER_NAME [COMMENT]"
    echo
    echo "has de ser root"
    echo "COMMENT inclourà el nom complet de l'usuari"
    exit 1 #indica que hi ha hagut una errada
}

#Script per crear un usari

#primer comprovam si som l'usari root
if [[ ${UID} -ne 0 ]]
then
    usage
fi

#hem de comprovar que tenim al manco un paràmtre
if [[ ${#} -eq 0 ]]
then
    usage
fi

USER_NAME=${1}
#desplaçam paràmtres a l'esquerra
shift
COMMENTS=${*}

#generam password aleatori
PASSWORD=$(date +%s%N | sha256sum | head -c8 )


#crearíem l'usuari
useradd -m -c "${COMMENTS}" ${USER_NAME} &> /dev/null
#control de la darrera comanda
if [[ ${?} -ne 0 ]]
then
    echo "Errada creat l'usuari"
    exit 1
fi

#canvi de password
echo "${USER_NAME}:${PASSWORD}" | chpasswd
#comprovam si el canvi de password ha anat bé.
if [[ ${?} -ne 0 ]]
then
    echo "Errada Canviant password"
    exit 1
fi

#fer el caducar el password
passwd -e ${USER_NAME}

#informam del que s'ha creat
echo "nom complet: ${COMMENTS}"
echo "Usuari creat: ${USER_NAME}"
echo "password generat: ${PASSWORD}"
echo "HostName: ${HOSTNAME}"

exit 0