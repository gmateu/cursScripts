#!/bin/bash
function usage(){
    echo "Usage ${0}"
    echo
    echo "has de ser root"
    echo "l'usari no és pot reptir"
    exit 1 #indica que hi ha hagut una errada
}

#Script per crear un usari

#primer comprovam si som l'usari root
if [[ ${UID} -ne 0 ]]
then
    usage
fi

read -p "Introdueix el nom complet: " COMMENTS
#demanam el nom de l'usuari
read -p "Introdueix el nom d'usuari: " USER_NAME
#generarem aleatòriament
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
echo "Usuari creat: ${USER_NAME}"
echo "password generat: ${PASSWORD}"
echo "HostName: ${HOSTNAME}"

exit 0