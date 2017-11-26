#!/bin/sh 


CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CURRENT_PID=$$

docker events --filter 'event=start' --filter 'event=stop' --format '{{.ID}}' | while read container_id

do

	$CURRENT_DIR/docker-update-all-containers-hosts.sh

    #echo $container_id

    #ipaddress=`docker inspect --format='{{.NetworkSettings.IPAddress}}' $container_id`
    #name=`docker inspect --format='{{.Name}}' $container_id`
    #port=`docker inspect --format='{{(index (index .NetworkSettings.Ports "80/tcp") 0).HostPort}}' $container_id`
    #domain=`docker inspect --format='{{.Config.Domainname}}' $container_id`
    #host=`docker inspect --format='{{.Config.Hostname}}' $container_id`
    
    #echo "$name $ipaddress $host"

    #echo $ipaddress
    #echo $host
    #echo $port
    #echo $host.$domain

done
