#!/usr/bin/env bash

HOSTNAME=$(hostname)
IPADDRESS=$(hostname -I)

MYID=$1
ZK=$2

echo "hostname: $HOSTNAME"
echo "ip: $IPADDRESS"

if [ -z ${MYID} ];
then
  MYID=1
  echo "$MYID" > /data/zookeeper/myid
  ZOO_LOG_DIR=/data/logs ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' zkServer.sh start-foreground
else  
  echo "server.1=zookeeper1:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
  echo "server.2=zookeeper2:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
  echo "server.3=zookeeper3:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
  echo "$MYID" > /data/zookeeper/myid
  ZOO_LOG_DIR=/data/logs ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' zkServer.sh start-foreground
fi

if [ -z ${1} ];
then
  bash
  exit 0;
fi
