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

echo "Starting YARN resourcemanager..."
/hadoop/sbin/yarn-daemon.sh start resourcemanager

#echo "Starting HDFS namenode..."
#/hadoop/sbin/hadoop-daemon.sh --script hdfs start namenode

#/hadoop/bin/yarn --daemon start resourcemanager
#/hadoop/sbin/start-dfs.sh
#/hadoop/sbin/start-yarn.sh
#/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver

tail -f /hadoop/logs/*
/hadoop/sbin/yarn-daemon.sh stop resourcemanager
#/hadoop/sbin/hadoop-daemon.sh --script hdfs stop namenode