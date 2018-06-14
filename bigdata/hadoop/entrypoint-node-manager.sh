#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

echo "-----------------------------------------------------------"
echo "Starting SSH service..."
echo "-----------------------------------------------------------"
/usr/sbin/sshd
sleep 5

ping -c 1 hadoop1
ping -c 1 localhost

echo "-----------------------------------------------------------"
echo "Starting YARN nodemanager..."
echo "-----------------------------------------------------------"
/opt/hadoop/sbin/yarn-daemon.sh start nodemanager


echo "-----------------------------------------------------------"
echo "Starting HDFS datanode..."
echo "-----------------------------------------------------------"
/opt/hadoop/sbin/hadoop-daemons.sh --script hdfs start datanode

echo "-----------------------------------------------------------"
echo "Starting reading logs..."
echo "-----------------------------------------------------------"
tail -f /opt/hadoop/logs/*.log
/opt/hadoop/sbin/yarn-daemon.sh stop nodemanager
/opt/hadoop/sbin/hadoop-daemons.sh --script hdfs stop datanode