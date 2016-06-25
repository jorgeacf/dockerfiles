#!/usr/bin/env bash

export JAVA_HOME="${JAVA_HOME:-/usr}"

if [ -n "$SLAVES" ]; then 
	i=1
	while [ $i -le $SLAVES ]
	do
		echo "hadoop-slave$i" >> slaves
		i=$(( $i + 1 ))
	done
	mv slaves /hadoop/etc/hadoop/slaves
fi

echo "Starting SSH service..."
/usr/sbin/sshd-keygen
/usr/sbin/sshd
sleep 1

echo "Starting Hadoop..."
/hadoop/sbin/start-dfs.sh
/hadoop/sbin/start-yarn.sh
tail -f /hadoop/logs/*
/hadoop/sbin/stop-yarn.sh
/hadoop/sbin/stop-dfs.sh