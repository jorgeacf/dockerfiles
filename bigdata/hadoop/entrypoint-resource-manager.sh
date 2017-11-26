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
echo "Starting YARN Resource Manager..."
echo "-----------------------------------------------------------"
/hadoop/sbin/yarn-daemon.sh start resourcemanager

echo "-----------------------------------------------------------"
echo "Starting HDFS Namenode..."
echo "-----------------------------------------------------------"
/hadoop/sbin/hadoop-daemon.sh --script hdfs start namenode

echo "-----------------------------------------------------------"
echo "Starting Job History Server..."
echo "-----------------------------------------------------------"
/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver

tail -f /hadoop/logs/*
/hadoop/sbin/yarn-daemon.sh stop resourcemanager
/hadoop/sbin/hadoop-daemon.sh --script hdfs stop namenode
/hadoop/sbin/mr-jobhistory-daemon.sh stop historyserver