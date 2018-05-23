#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

echo "-----------------------------------------------------------"
echo "Starting SSH service..."
echo "-----------------------------------------------------------"
/usr/sbin/sshd
sleep 1

echo "-----------------------------------------------------------"
echo "Starting YARN nodemanager..."
echo "-----------------------------------------------------------"
/opt/hadoop/sbin/yarn-daemon.sh start nodemanager


echo "-----------------------------------------------------------"
echo "Starting HDFS datanode..."
echo "-----------------------------------------------------------"
/opt/hadoop/sbin/hadoop-daemons.sh --script hdfs start datanode

tail -f /opt/hadoop/logs/*
/opt/hadoop/sbin/yarn-daemon.sh stop nodemanager
/opt/hadoop/sbin/hadoop-daemons.sh --script hdfs stop datanode