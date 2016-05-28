#!/usr/bin/env bash

mkdir -p /tmp/zookeeper
zkServer.sh start
sleep 2
zkCli.sh