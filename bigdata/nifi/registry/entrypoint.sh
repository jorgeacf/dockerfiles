#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

if [ "$1" = 'nifi-registry' ]; then

	eval $(ssh-agent -s)

	ssh-add ~/.ssh/id_rsa

	git config --global user.email "jorgefigueiredo@outlook.com"
	git config --global user.name "Jorge Figueiredo"

	git clone git@github.com:jorgeacf/nifi-flows.git /opt/nifi-registry/flow_storage

	/opt/nifi-registry/bin/nifi-registry.sh start;

	tail -f /dev/null /opt/nifi-registry/logs/*

fi

exec "$@"