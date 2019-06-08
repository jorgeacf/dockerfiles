#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

run () {
	
	ID1=$(docker run -itd ${REPO}:${VERSION})
	ID2=$(docker run -itd ${REPO}:${VERSION})
	ID3=$(docker run -itd ${REPO}:${VERSION})
	
	IP1=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $ID1)
	IP2=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $ID2)
	IP3=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $ID3)

	sleep 5s;

	docker logs $ID1 | grep "ssh user password"
	docker logs $ID2 | grep "ssh user password"
	docker logs $ID3 | grep "ssh user password"

	ssh-copy-id -i ../.ssh-keys/key user@$IP1
	ssh-copy-id -i ../.ssh-keys/key user@$IP2
	ssh-copy-id -i ../.ssh-keys/key user@$IP3

}