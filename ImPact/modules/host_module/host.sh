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
host_option=$(cat modules/host_module/host_option.txt)
if [ "$host_option" == "3" ]
then 
    clear
    function_logo ; echo ; echo -e ${LIGHT_GREEN} ; sleep 0.5
    check="$(ls /var/www | grep html)"
    if [ "$check" == "html" ]
    then 
        mv /var/www/html /var/www/html_avoid
        mkdir /var/www/html
    elif [ "$check" == "" ]
    then 
        mkdir /var/www/html
    else 
        rm -rf /var/www 
        mkdir /var/www | mkdir /var/www/html
    fi
    echo -e ${LIGHT_RED} 
    str="Website ie being hosted using Ngrok and Ssh, The new two terminals will have your domain."
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.02
    done ; sleep 1
    cp -r $(cat modules/inputs/name.txt).html /var/www/html/index.html ; service apache2 start ; firefox /var/www/html/index.html &
    xterm -title "ImPact ( Ngrok Host )" -e pyngrok http 80 &
    xterm -title "ImPact ( SSH Host )" -e ssh -R 80:localhost:80 nokey@localhost.run 
else 
    clear
    function_logo ; echo ; echo -e ${LIGHT_GREEN} ; sleep 0.5
    check="$(ls /var/www | grep html)"
    if [ "$check" == "html" ]
    then 
        mv /var/www/html /var/www/html_avoid
        mkdir /var/www/html
    elif [ "$check" == "" ]
    then 
        mkdir /var/www/html
    else 
        rm -rf /var/www 
        mkdir /var/www | mkdir /var/www/html
    fi
    echo -e ${LIGHT_RED} 
    str="Website ie being hosted using Ngrok and Ssh, The new two terminals will have your domain."
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.02
    done ; sleep 1
    cp -r $(cat modules/host_module/html_path.txt) /var/www/html/index.html ; service apache2 start ; firefox /var/www/html/index.html &
    xterm -title "ImPact ( Ngrok Host )" -e pyngrok http 80 &
    xterm -title "ImPact ( SSH Host )" -e ssh -R 80:localhost:80 nokey@localhost.run 
fi 

