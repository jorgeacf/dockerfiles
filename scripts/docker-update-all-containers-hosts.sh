#!/bin/bash

docker ps -q | xargs -n 1 docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' | sed 's/ \// /' > /tmp/hosts

awk '{ FS = " " ; print $2 }' /tmp/hosts | sort > /tmp/containers

echo '127.0.0.1 localhost' >> /tmp/hosts

sort /tmp/hosts -o /tmp/hosts

while IFS='' read -r container || [[ -n "$container" ]]; do
	echo $container
    docker cp /tmp/hosts $container:hosts
    docker exec $container /bin/sh -c "cat hosts > /etc/hosts"
    docker exec $container /bin/sh -c "rm hosts"
done < /tmp/containers

sudo cp /tmp/hosts /etc/hosts

rm /tmp/hosts
rm /tmp/containers
