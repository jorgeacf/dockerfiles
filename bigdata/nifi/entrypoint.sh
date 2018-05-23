#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

HOSTNAME="$(echo -e "$(hostname)" | tr -d '[:space:]')"
IPADDRESS="$(echo -e "$(hostname -I)" | tr -d '[:space:]')"

echo "Hostname=[${HOSTNAME}]"
echo "IPADDRESS=[${IPADDRESS}]"

if [ "$1" = 'nifi' ]; then

	# Replace configuration
	sed -i -e "s/nifi.cluster.node.address=/nifi.cluster.node.address=${IPADDRESS}/g" $NIFI_HOME/conf/nifi.properties
	sed -i -e "s/nifi.remote.input.host=/nifi.remote.input.host=${IPADDRESS}/g" $NIFI_HOME/conf/nifi.properties
	sed -i -e "s/nifi.web.http.host=/nifi.web.http.host=${IPADDRESS}/g" $NIFI_HOME/conf/nifi.properties

	$NIFI_HOME/bin/nifi.sh start;

	tail -f /dev/null $NIFI_HOME/logs/*.log

fi

exec "$@"