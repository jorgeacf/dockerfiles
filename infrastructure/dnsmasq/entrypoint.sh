#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

#HOSTNAME="$(echo -e "$(hostname)" | tr -d '[:space:]')"
#IPADDRESS="$(echo -e "$(hostname -I)" | tr -d '[:space:]')"

#echo "Hostname=[${HOSTNAME}]"
#echo "IPADDRESS=[${IPADDRESS}]"

if [ "$1" = 'dnsmasq' ]; then

	echo "Starting to look for hosts changes..."
	while true; do
		inotifywait -r -e modify,attrib,close_write,move,create,delete /hosts && pkill -SIGHUP dnsmasq
	done &

	echo "Starting dnsmasq..."
	dnsmasq -d --no-hosts
fi

exec "$@"