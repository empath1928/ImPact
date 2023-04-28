#!/usr/bin/bash
domain="$(cat modules/inputs/domain.txt)"
port="$(cat modules/inputs/port.txt)"
name="$(cat modules/inputs/name.txt)"
echo $(curl -IL $domain) > modules/clone_module/request.txt
protocal=$(cat modules/clone_module/request.txt | head -n 1 | grep "HTTP" | awk '{print $2""}')
if [ "$protocal" == "200" ]
then 
    curl http://$domain/ > $name.html
else 
    curl https://$domain/ > $name.html
fi 
