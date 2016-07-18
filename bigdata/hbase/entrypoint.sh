#!/usr/bin/env bash

export JAVA_HOME="${JAVA_HOME:-/usr}"

mkdir /hbase/logs
mkdir -p /tmp/zookeeper

echo "Starting SSH service..."
/usr/sbin/sshd-keygen
/usr/sbin/sshd
sleep 1

if [ "$NODE_TYPE" = "m" ]; then
	echo 'Running HBase master...';
	mv /hbase/conf/hbase-site-master.xml /hbase/conf/hbase-site.xml
	/hbase/bin/start-hbase.sh
	/hbase/bin/hbase-daemon.sh start rest
	/hbase/bin/hbase-daemon.sh start thrift
	/hbase/bin/hbase shell
	/hbase/bin/stop-hbase.sh

elif [ "$NODE_TYPE" = "s" ]; then
	echo 'Running HBase slave...';
	mv /hbase/conf/hbase-site-slave.xml /hbase/conf/hbase-site.xml
	/hbase/bin/hbase-daemon.sh start regionserver
	#/hbase/bin/hbase shell
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

bash