#!/usr/bin/env bash

sleep 10

export JAVA_HOME="${JAVA_HOME:-/usr}"
export HBASE_HOME=/hbase

mkdir /hbase/logs
mkdir -p /tmp/zookeeper

echo "Starting SSH service..."
/usr/sbin/sshd-keygen
/usr/sbin/sshd
sleep 1

if [ "$NODE_TYPE" = "m" ]; then
	echo 'Running HBase master...';
	mv /hbase/conf/hbase-site-master.xml /hbase/conf/hbase-site.xml
	export HBASE_CONF_DIR=$HBASE_HOME/conf
	
  	$HBASE_HOME/bin/hbase-daemons.sh --config "${HBASE_CONF_DIR}" --hosts /hbase/conf/regionservers start regionserver

	$HBASE_HOME/bin/hbase-daemon.sh --config "${HBASE_CONF_DIR}" start master

	#/hbase/bin/hbase-daemon.sh start master
	#/hbase/bin/start-hbase.sh
	/hbase/bin/hbase-daemon.sh start rest
	/hbase/bin/hbase-daemon.sh start thrift
	#/hbase/bin/hbase shell
	#/hbase/bin/stop-hbase.sh
	#sleep 1d

elif [ "$NODE_TYPE" = "s" ]; then
	echo 'Running HBase slave...';
	mv /hbase/conf/hbase-site-slave.xml /hbase/conf/hbase-site.xml
	export HBASE_CONF_DIR=$HBASE_HOME/conf
	#/hbase/bin/start-hbase.sh
	#/hbase/bin/hbase-daemon.sh start regionserver
	#/hbase/bin/hbase shell
	#sleep 1d
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