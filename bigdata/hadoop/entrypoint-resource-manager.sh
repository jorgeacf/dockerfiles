#!/usr/bin/env bash

#set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

echo "-----------------------------------------------------------"
echo "Starting SSH service..."
echo "-----------------------------------------------------------"
/usr/sbin/sshd
sleep 5

alias ping=ping -4

ping -c 1 hadoop1
ping -c 1 localhost

echo "-----------------------------------------------------------"
echo "Starting YARN Resource Manager..."
echo "-----------------------------------------------------------"
/opt/hadoop/sbin/yarn-daemon.sh start resourcemanager

echo "-----------------------------------------------------------"
echo "Starting HDFS Namenode..."
echo "-----------------------------------------------------------"
/opt/hadoop/sbin/hadoop-daemon.sh --script hdfs start namenode
echo "EXIT_CODE=[$?]"

echo "-----------------------------------------------------------"
echo "Starting Job History Server..."
echo "-----------------------------------------------------------"
/opt/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver

echo "-----------------------------------------------------------"
echo "Starting reading logs..."
echo "-----------------------------------------------------------"
tail -f /opt/hadoop/logs/*.log
/opt/hadoop/sbin/yarn-daemon.sh stop resourcemanager
/opt/hadoop/sbin/hadoop-daemon.sh --script hdfs stop namenode
/opt/hadoop/sbin/mr-jobhistory-daemon.sh stop historyserver