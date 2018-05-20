#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

if [ "$1" = 'zeppelin' ]; then

	zeppelin-daemon.sh start

	tail -f /opt/zeppelin/logs/*.log
fi

exec "$@"