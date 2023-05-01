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
            ▒▒▒▒▒▒▒▒▒▒▒▒${LIGHT_GRAY}          Setup
"
echo -e ${LIGHT_PURPLE} ; sleep 1
str="   Impact, The most advanced version of Site-Map" 
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.02
done
}

#setup 
clear
function_logo ; echo ; echo -e ${LIGHT_GREEN}
str="Checking & Downloading all the requirements..." 
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.04
done ; echo ; echo ; sleep 1

#lolcat
echo -e ${LIGHT_CYAN}"Checking Lolcat" ; sleep 0.5 
lolcat=$(which lolcat | grep -oP "lolcat")
if [ "$lolcat" == "lolcat" ]
then 
    echo -e ${LIGHT_GREEN}"_/ Installed"
else 
echo -e ${LIGHT_YELLOW}"Downloading Lolcat" ; apt-get install lolcat -y
fi 

#Pip
echo -e ${LIGHT_CYAN}"Checking PIP" ; sleep 0.5 
pip=$(which pip | grep -oP "pip")
if [ "$pip" == "pip" ]
then 
    echo -e ${LIGHT_GREEN}"_/ Installed"
else 
echo -e ${LIGHT_YELLOW}"Downloading PIP" ; apt-get install pip -y
fi 

#Pyngrok
echo -e ${LIGHT_CYAN}"Checking PyNgrok" ; sleep 0.5 
pyngrok=$(which pyngrok | grep -oP "pyngrok")
if [ "$pyngrok" == "pyngrok" ]
then 
    echo -e ${LIGHT_GREEN}"_/ Installed"
else 
echo -e ${LIGHT_YELLOW}"Downloading PyNgrok" ; pip install pyngrok -y
fi 

#xterm
echo -e ${LIGHT_CYAN}"Checking PyNgrok" ; sleep 0.5 
xterm=$(which xterm | grep -oP "xterm")
if [ "$xterm" == "xterm" ]
then 
    echo -e ${LIGHT_GREEN}"_/ Installed"
else 
echo -e ${LIGHT_YELLOW}"Downloading PyNgrok" ; apt-get install xterm -y 
fi 

#SSG
echo -e ${LIGHT_CYAN}"Checking SSH" ; sleep 0.5 
ssh=$(which ssh | grep -oP "ssh")
if [ "$ssh" == "ssh" ]
then 
    echo -e ${LIGHT_GREEN}"_/ Installed"
else 
echo -e ${LIGHT_YELLOW}"Downloading SSH" ; apt-get install ssh -y
fi 

echo ; echo -e ${LIGHT_YELLOW}
str="All requirements are downloaded, Now setting up the PyNgrok, If you don't have Ngrok account, visit https://ngrok.com/ and create and account and you will get a auth token..." 
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.02
done ; echo ; echo -e ${LIGHT_GRAY} ; sleep 3

#Pyngrok authtoken
while true 
do
    clear 
    function_logo ; echo ; echo -e ${LIGHT_GRAY}
    read -p "Enter your ngrok token (~ " ngrok_token
    length=${#ngrok_token}
    if [ $length -ge 32 ] ; then 
    echo -e ${LIGHT_GREEN}
    str="Adding ngrok authtoken to pyngrok" 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.1
    done ; echo ; echo ; pyngrok authtoken $ngrok_token ; sleep 1
    echo $ngrok_token > modules/pyngrok_module/pyngrok_token.txt ; sleep 1 ; break

    else  
    echo -e ${LIGHT_RED}
    str="Invalid ngrok token"
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.1
    done ; echo -e ${LIGHT_GRAY} ; echo ; sleep 1
    fi 
done

echo -e ${LIGHT_CYAN}
str="Ngrok token has been sucessfully added..."
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.1
done ; sleep 2 ; echo ; echo -e ${LIGHT_GREEN}

#Magageing permissions
str="Managing the permissions..."
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.1
done ; sleep 2 ; echo ; echo -e ${LIGHT_CYAN}
chmod +x ImPact.sh
chmod +x modules/pyngrok_module/pyngrok_token.txt
chmod +x modules/host_module/host.sh
chmod +x modules/clone_module/clone.sh
chmod +x modules/dos_module/dos.sh | chmod +x modules/dos_module/dos.py

str="Setup is completed sucessfully..."
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.1
done ; sleep 2 ; echo 

#Starting the tool
while true
do
echo -e ${LIGHT_YELLOW}
read -p "Would you like the start the tool now ? (Y/n) ---⋟ " start
if [[ "$start" == "Y" || "$start" == "y" ]]
then
echo -e ${LIGHT_CYAN}
str="Starting the tool..."
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.1
done ; sleep 1 ; clear ; bash ImPact.sh

elif [[ "$start" == "N" || "$start" == "n" ]]
then
break 

else
echo -e ${LIGHT_RED}
str="Invalid option..."
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.1
done ; echo ; sleep 1
fi
done
