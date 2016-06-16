#!/usr/bin/env bash

mkdir -p /tmp/zookeeper
./zookeeper/bin/zkServer.sh start
sleep 2
./zookeeper/bin/zkCli.sh