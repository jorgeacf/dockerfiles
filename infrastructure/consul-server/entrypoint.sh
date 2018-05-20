#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

HOSTNAME="$(echo -e "$(hostname)" | tr -d '[:space:]')"
IPADDRESS="$(echo -e "$(hostname -I)" | tr -d '[:space:]')"

echo "Hostname=[${HOSTNAME}]"
echo "IPADDRESS=[${IPADDRESS}]"

consul agent -server -bootstrap -ui -config-file /opt/consul/config/configuration.json -client $IPADDRESS -bind $IPADDRESS