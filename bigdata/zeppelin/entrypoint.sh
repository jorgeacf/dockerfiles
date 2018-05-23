#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

if [ "$1" = 'zeppelin' ]; then

	export HADOOP_HOME=/opt/hadoop
	export PATH=$PATH:$HADOOP_HOME/bin

	zeppelin-daemon.sh start

	tail -f /opt/zeppelin/logs/*.log
fi

exec "$@"