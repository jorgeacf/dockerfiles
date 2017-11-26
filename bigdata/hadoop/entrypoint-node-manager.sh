#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

echo "-----------------------------------------------------------"
echo "Starting SSH service..."
echo "-----------------------------------------------------------"
/usr/sbin/sshd-keygen
/usr/sbin/sshd
sleep 1

echo "-----------------------------------------------------------"
echo "Starting YARN nodemanager..."
echo "-----------------------------------------------------------"
/hadoop/sbin/yarn-daemon.sh start nodemanager


echo "-----------------------------------------------------------"
echo "Starting HDFS datanode..."
echo "-----------------------------------------------------------"
/hadoop/sbin/hadoop-daemons.sh --script hdfs start datanode

tail -f /hadoop/logs/*
sleep 1000

/hadoop/sbin/yarn-daemon.sh stop nodemanager
/hadoop/sbin/hadoop-daemons.sh --script hdfs stop datanode