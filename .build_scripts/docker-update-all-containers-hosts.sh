#!/bin/bash

#docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{.Name}}' | sed 's/ \// /' > /tmp/hosts
docker ps -q | xargs -n 1 docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' | sed 's/ \// /' > /tmp/hosts

awk '{ FS = " " ; print $2 }' /tmp/hosts | sort > /tmp/containers

echo '127.0.0.1 localhost' >> /tmp/hosts

sort /tmp/hosts -o /tmp/hosts

sudo cp /tmp/hosts /etc/hosts

#echo ""
#cat /etc/hosts
#echo ""
while IFS='' read -r container || [[ -n "$container" ]]; do
	#echo "$container"
    #docker cp /tmp/hosts $container:hosts
    #docker exec $container /bin/sh -c "cat hosts > /etc/hosts; rm hosts"
    docker exec ${container} sh -c "echo \"$(cat /etc/hosts)\" > /etc/hosts"
done < /tmp/containers
#echo ""

rm /tmp/hosts
rm /tmp/containers
