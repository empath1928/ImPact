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

#Some important parameters
#Default Local ip
DL_ip=$(ifconfig | grep 'inet ' | awk '{print $2}' | head -n 1)
DL_port=8000

#domain and port input function
domain_port_input_function() {
echo -e ${LIGHT_PURPLE}
str="Provide the IpAdress/Domain of the target ( Without http:// ) >>> " 
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.04
done ; read domain
while [ "$domain" == "" ]
do 
echo -e ${LIGHT_RED}
str="You can't leave it empty... Provide the IpAdress/Domain of the target ( Without https:// ) >>> "
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.02
done ; read domain
done ; echo $domain > modules/inputs/domain.txt
echo -e ${LIGHT_RED}
str="Provide the Port the target website is running on ( Skip for default : 80 ) >>> " 
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.04
done ; read port
if [ "$port" == "" ]
then 
    port=80
fi 
while [ "$port" -gt "65535" ]
do 
echo -e ${LIGHT_RED}
str="Port should be in this range ( 1 - 65535) ) >>> "
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.02
done ; read port
done ; echo $port > modules/inputs/port.txt
}

#About Us function
about_us_logo_function () {
clear
echo -e ${LIGHT_PURPLE}"      
            ▒▒▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒▒▒
            ▒▒▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒▒▒   ███ █▄┼▄█ ███ ███ ███ ███   
            ▒▒▒▒▒▒▒▒▒▒▒▒   ┼█┼ █┼█┼█ █▄█ █▄█ █┼┼ ┼█┼ 
            ▒${LIGHT_RED}▓${LIGHT_PURPLE}▒▒▒▒▒▒▒▒${LIGHT_RED}▓${LIGHT_PURPLE}▒   ▄█▄ █┼┼┼█ █┼┼ █┼█ ███ ┼█┼   
            ▒▒${LIGHT_RED}▓▓▓▓▓▓▓▓${LIGHT_PURPLE}▒▒
            ▒▒▒▒▒▒▒▒▒▒▒▒
"
echo " 
●̮̮̃•̃)   
/█\  @Anil Shrestha
.Π.    
" | lolcat ; sleep 0.5 ; echo -e ${LIGHT_CYAN}

str2="Empath - ImPact is the upgraded version of pervious website cloning tool Site-Map by @Anil Shrestha. Don't use it for any malicious purpose or I won't be responsible for it. This tool features :-
"
for ((i=0; i<${#str2}; i++)); do
echo -n "${str2:$i:1}"
sleep 0.02
done ; echo -e ${LIGHT_YELLOW}
str3="[ 1 ] ---> Checking if any website is vulnerable to Slowloris Dos Attack.
[ 2 ] ---> Performing Slowloris Dos Attack on any vulnerable website
[ 3 ] ---> Cloning any types of website ( 90 % accurately )
[ 4 ] ---> Performing Slowloris Dos Attack while cloning the website
[ 5 ] ---> Direct website link using NGROK and SSH port forwarding on both HTTP & HTTPS"
for ((i=0; i<${#str3}; i++)); do
echo -n "${str3:$i:1}"
sleep 0.02
done ; echo -e ${LIGHT_CYAN}
str4="
This tool is only made for educational purpose to demonstrate how easy is that nowdays to compromise any devices over World with this type of scripts for anyone.Please do not use it for any malecius purpsoe otherwise I won't be responsible...
Author - Anil Shrestha ( Empath )
Github - https://github.com/empath1928
Contact - anilshresthasaecrets@gmail.com 
"
for ((i=0; i<${#str4}; i++)); do
echo -n "${str4:$i:1}"
sleep 0.02
done ; read
} 

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

# Not authenticated token
pyngrok_token=$(cat modules/pyngrok_module/pyngrok_token.txt)
length=${#pyngrok_token}
if [ "$length" -lt "32" ] 
then
    clear
    function_logo ; sleep 2 ; echo 
    echo ; echo -e ${LIGHT_RED}
    str="Ngrok is not authenticated. First fulfill the setup..."
    for((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.04
    done ; sleep 2 ; ./setup.sh
fi

#Starting
while true
do
clear
function_logo ; echo ; echo -e ${LIGHT_RED} ; echo
echo -e "
|￣￣￣￣￣￣￣ |  
|   ${LIGHT_PURPLE}𝕀𝕞ℙ𝕒𝕔𝕥${LIGHT_RED}      |
|＿＿＿＿＿ _＿_|
(\__/) || 
(•ㅅ•) || ${LIGHT_PURPLE} Author - Anil Shrestha${LIGHT_RED}
/ 　 づ   ${LIGHT_PURPLE} Gitub - https://github.com/empath1928

${LIGHT_RED}[${LIGHT_GRAY} 1 ${LIGHT_RED}]${LIGHT_GRAY} Check if target is vulnerable to Slowloris Dos Attack
${LIGHT_RED}]▄▄▄▄▄▄▄▄▄▄▄▄▄-----------------------------------------------●
${LIGHT_RED}[${LIGHT_GRAY} 2 ${LIGHT_RED}]${LIGHT_GRAY} Perform a Slowloris Dos Attack on target
${LIGHT_RED}]▄▄▄▄▄▄▄▄▄▄▄▄▄-----------------------------------------------●
${LIGHT_RED}[${LIGHT_GRAY} 3 ${LIGHT_RED}]${LIGHT_GRAY} Clone any website ( 90% ) Accurate and host it over WAN
${LIGHT_RED}]▄▄▄▄▄▄▄▄▄▄▄▄▄-----------------------------------------------●
${LIGHT_PURPLE}[${LIGHT_GRAY} 4 ${LIGHT_PURPLE}]${LIGHT_GRAY} Deploy your own website over WAN
${LIGHT_PURPLE}]▄▄▄▄▄▄▄▄▄▄▄▄▄-----------------------------------------------●
${LIGHT_PURPLE}[${LIGHT_GRAY} 5 ${LIGHT_PURPLE}]${LIGHT_GRAY} About Us ( About Me hehe )
${LIGHT_PURPLE}]▄▄▄▄▄▄▄▄▄▄▄▄▄-----------------------------------------------●
${LIGHT_PURPLE}[${LIGHT_GRAY} 99 ${LIGHT_PURPLE}]${LIGHT_GRAY} Exit ( Thanks for using )
${LIGHT_PURPLE}]▄▄▄▄▄▄▄▄▄▄▄▄▄-----------------------------------------------●
" ; echo -e ${LIGHT_RED} ; read -p "Empath ▄︻̷̿┻̿═━一 " options

if [[ ("$options" == "1" || "$options" == "ONE" || "$options" == "One" || "$options" == "one" ) ]] 
then 
domain_port_input_function ; echo -e ${LIGHT_GREEN} 
str="Checking if the target : https//$(cat modules/inputs/domain.txt)/ is vulnerable to Slowloris DoS Attack,
wait for some time, It may take a while..." 
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.03
done ; sleep 1
raw_packets_recived=$(nmap $domain -p$(cat modules/inputs/port.txt) --script=http-slowloris-check -v | grep 'Raw packets sent' | awk '{print $8""}') 
echo 
if [ "$raw_packets_recived" -ge "5" ]
then 
    echo -e ${LIGHT_CYAN}
    str="This website : $(cat modules/inputs/domain.txt) is most likely to be 100% vulnerable to Slowloris Dos Attack " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read

elif [ "$raw_packets_recived" -eq "4" ]
then 
    echo -e ${LIGHT_GREEN}
    str="This website : $(cat modules/inputs/domain.txt) is likely to be 80% vulnerable to Slowloris Dos Attack " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read

elif [ "$raw_packets_recived" -eq "3" ]
then 
    echo -e ${LIGHT_GREEN}
    str="This website : $(cat modules/inputs/domain.txt) is likely to be 60% vulnerable to Slowloris Dos Attack " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read

elif [ "$raw_packets_recived" -eq "2" ]
then 
    echo -e ${LIGHT_GREEN}
    str="This website : $(cat modules/inputs/domain.txt) is likely to be 40% vulnerable to Slowloris to Dos Attack " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read

elif [ "$raw_packets_recived" -eq "1" ]
then 
    echo -e ${LIGHT_GREEN}
    str="This website : $(cat modules/inputs/domain.txt) is likely to be 10% vulnerable to Slowloris to Dos Attack " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read

else 
    echo -e ${LIGHT_RED}
    str="This website : $(cat modules/inputs/domain.txt) is not likely to be vulnerable to Slowloris Dos Attack" 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read
fi 


elif [[ ("$options" == "2" || "$options" == "TWO" || "$options" == "Two" || "$options" == "two" ) ]] 
then 
    domain_port_input_function ;    echo -e ${LIGHT_PURPLE}
    str="Number of sockets you wanna use ( skip for default : 500 ) ? ▄︻̷̿┻̿═━一 " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read sockets ; echo $sockets > modules/inputs/sockets.txt
    while [ "$sockets" == "" ]
    do 
        echo 500 > modules/inputs/sockets.txt
    done 
    echo -e ${LIGHT_GREEN} 
    str="Attempting Slowloris Dos Attack on target : https://$(cat modules/inputs/domain.txt)/, Press Ctrl + c to exit..." 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; xterm -title "ImPact ( Slowloris Dos )" -e bash modules/dos_module/dos.sh ; echo -e ${LIGHT_CYAN} ; echo
    str="Thankyou for using ImPact" 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done

elif [[ ("$options" == "3" || "$options" == "THREE" || "$options" == "Three" || "$options" == "three" ) ]] 
then 
    echo 3 > modules/host_module/host_option.txt
    domain_port_input_function 
    echo -e ${LIGHT_PURPLE}
    str="Name of the html file to save ▄︻̷̿┻̿═━一 " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read webpage_name
    while [ "$webpage_name" == "" ]
    do  
        echo -e ${LIGHT_RED}
        str="You can't leave it empty, Give it a name ▄︻̷̿┻̿═━一 " 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; read webpage_name
    done 
    echo $webpage_name > modules/inputs/name.txt

    while true 
    do 
    echo -e ${LIGHT_GRAY}
    str="Do you want to perform Slowloris Dos Attack at the same time ? ▄︻̷̿┻̿═━一 " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read dos_option
    while [ "$dos_option" == "" ]
    do 
        echo -e ${LIGHT_RED}
        str="You can't leave it empty, Answer in (Y/n) ? ▄︻̷̿┻̿═━一 " 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; read dos_option 
    done 
    if [[ ( "$dos_option" == "Y" || "$dos_option" == "y" ) ]]
    then 
        echo -e ${LIGHT_RED}
        str="Number of sockets you wanna use ( skip for default : 500 ) ? ▄︻̷̿┻̿═━一 " 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; read sockets 
        if [ "$sockets" == "" ]
        then
            echo 500 > modules/inputs/sockets.txt
        else 
            echo $sockets > modules/inputs/sockets.txt
        fi 
        echo -e ${LIGHT_GREEN} 
        str="Attempting Slowloris Dos Attack on target : https://$(cat modules/inputs/domain.txt)/" 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; echo ; xterm -title "ImPact ( Slowloris Dos )" -e bash modules/dos_module/dos.sh & 
        break
    elif [[ ( "$dos_option" == "N" || "$dos_option" == "n" ) ]]
    then 
        break
    else 
        echo -e ${LIGHT_RED}
        str="Invalid option..." 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; sleep 1 ; echo
    fi 
    done ; echo -e ${LIGHT_GREEN}
    str="Cloning the website..." 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; sleep 0.5 ; echo  
    xterm -title "ImPact ( Webpage Cloner )" -e bash modules/clone_module/clone.sh
    sleep 0.5 ; echo -e ${LIGHT_PURPLE}
    str="Website sucessfully cloned and saved to" 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; echo -e ${LIGHT_GREEN} ; echo "$(pwd)/$(cat modules/inputs/name.txt).html" ; sleep 1
    echo -e ${LIGHT_PURPLE}
    while true
    do
    str="Do you want to host it over LAN & WAN (Y/n) ▄︻̷̿┻̿═━一 ? " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read host 
    while [ "$host" == "" ]
    do 
        echo -e ${LIGHT_RED}
        str="Don't leave it empty, Do you want to host it over LAN & WAN (Y/n) ▄︻̷̿┻̿═━一 ? " 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; read host 
    done 

    if [[ ("$host" == "Y" || "$host" == "y") ]]
    then 
        echo -e ${LIGHT_GREEN}
        str="Hosting it over LAN & WAN, Press Ctrl + C to exit..." 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; sleep 0.5 ; echo
        xterm -title "ImPact ( WebHosting )" -e bash modules/host_module/host.sh ; echo -e ${LIGHT_CYAN}
        str="Closing the website..." 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; sleep 1 ; rm -rf /var/www/html ; service apache2 stop  
        check=$(ls /var/www | grep "html_avoid")
        if [ "$check" == "html_avoid" ]
        then 
            mv /var/www/html_avoid /var/www/html ; echo -e ${LIGHT_GREEN} 
        else
            rm -rf /var/www 
            mkdir /var/www | mkdir /var/www/html ; echo -e ${LIGHT_GREEN}
        fi
        str="Website turned off sucessfully, Thankyou for using... Press enter to continue..." 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; sleep 1 ; read ; break

    elif [[ ("$host" == "N" || "$host" == "n") ]]
    then 
        break
    else 
        echo -e ${LIGHT_RED}
        str="Invalid option..." 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; sleep 1 ; echo ; echo -e ${LIGHT_PURPLE}
    fi 
    done

elif [[ ("$options" == "4" || "$options" == "FOUR" || "$options" == "Four" || "$options" == "four" ) ]] 
then 
    echo -e ${LIGHT_YELLOW} 
    echo 4 > modules/host_module/host_option.txt
    str="Full path to your html page with full name ( including html ) ▄︻̷̿┻̿═━一 " 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; read html_path 
    while [ "$html_path" == "" ]
    do  
        echo -e ${LIGHT_RED}
        str="You can't leave it empty, Give full path to your html page with full name ( including .html ) ▄︻̷̿┻̿═━一 " 
        for ((i=0; i<${#str}; i++)); do
        echo -n "${str:$i:1}"
        sleep 0.03
        done ; read html_path
    done
    echo $html_path > modules/host_module/html_path.txt 
    echo -e ${LIGHT_GREEN}
    str="Hosting it over LAN & WAN, Press Ctrl + C to exit..." 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; xterm -title "ImPact ( WebHosting )" -e bash modules/host_module/host.sh ; echo -e ${LIGHT_CYAN}
    service apache2 stop ; rm -rf /var/www/html
    check=$(ls /var/www | grep "html_avoid")
    if [ "$check" == "html_avoid" ]
    then 
        mv /var/www/html_avoid /var/www/html ; echo -e ${LIGHT_GREEN} 
    else
        rm -rf /var/www 
        mkdir /var/www | mkdir /var/www/html ; echo -e ${LIGHT_GREEN} 
    fi
    str="Website turned off sucessfully, Thankyou for using... Press enter to continue..." 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; sleep 1 ; read 

elif [[ ("$options" == "5" || "$options" == "FIVE" || "$options" == "Five" || "$options" == "five" ) ]] 
then 
    about_us_logo_function

elif [[ ("$options" == "99" || "$options" == "EXIT" || "$options" == "Exit" ) ]] 
then 
    echo -e ${LIGHT_CYAN} 
    str="Thanks for using it." 
    for ((i=0; i<${#str}; i++)); do
    echo -n "${str:$i:1}"
    sleep 0.03
    done ; sleep 2 ; break

else
echo -e ${LIGHT_RED}
str="Invalid Option..." 
for ((i=0; i<${#str}; i++)); do
echo -n "${str:$i:1}"
sleep 0.04
done ; sleep 1
fi
done