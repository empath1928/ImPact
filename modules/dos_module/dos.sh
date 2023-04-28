#!/usr/bin/bash
#Color values
RED='\033[0;31m'
BLUE='\033[0;34m'
LIGHT_YELLOW='\e[93m'
LIGHT_CYAN='\033[1;36m'
LIGHT_GRAY='\033[0;37m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'

#Logo function
function_logo () {
echo -e ${LIGHT_PURPLE}"      
            ▒▒▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒▒▒
            ▒▒▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒▒▒   ███ █▄┼▄█ ███ ███ ███ ███   
            ▒▒▒▒▒▒▒▒▒▒▒▒   ┼█┼ █┼█┼█ █▄█ █▄█ █┼┼ ┼█┼ 
            ▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒▒▒▒▒▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒   ▄█▄ █┼┼┼█ █┼┼ █┼█ ███ ┼█┼   
            ▒▒${LIGHT_RED}▓▓▓▓▓▓▓▓${LIGHT_PURPLE}▒▒
            ▒▒▒▒▒▒▒▒▒▒▒▒
"
echo -e ${LIGHT_PURPLE} ; sleep 1
str="   Impact, The most advanced version of Site-Map" 
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.02
done
}

function_logo ; echo ; echo -e ${LIGHT_GREEN}
str="Attacking : https://$(cat modules/inputs/domain.txt)/ 
Port : $(cat modules/inputs/port.txt)
Sockets : $(cat modules/inputs/sockets.txt)
" 
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.03
done ; echo -e ${LIGHT_RED} ; sleep 1
python modules/dos_module/dos.py $(cat modules/inputs/domain.txt) -p $(cat modules/inputs/port.txt) -s $(cat modules/inputs/sockets.txt) -v