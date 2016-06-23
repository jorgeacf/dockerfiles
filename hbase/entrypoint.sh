#!/usr/bin/env bash

export JAVA_HOME="${JAVA_HOME:-/usr}"

mkdir /hbase/logs

if [ "$NODE_TYPE" = "m" ]; then
	echo 'Running HBase master...';

elif [ "$NODE_TYPE" = "s" ]; then
	echo 'Running HBase slave...';

else
	echo 'Running HBase on standalone mode...'
	/hbase/bin/hbase zookeeper &>/hbase/logs/zookeeper.log &
	/hbase/bin/start-hbase.sh
	/hbase/bin/hbase-daemon.sh start rest
	/hbase/bin/hbase-daemon.sh start thrift
	/hbase/bin/hbase shell
	/hbase/bin/stop-hbase.sh
	pkill -f -i zookeeper
fi