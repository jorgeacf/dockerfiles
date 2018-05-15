#!/usr/bin/env bash

HOSTNAME=$(hostname)
IPADDRESS=$(hostname -I)

MYID=${1:-1}
ZK=$2

#if [ -z ${1} ];
#then
#  bash
#  exit 0;
#fi

echo "hostname: $HOSTNAME"
echo "ip: $IPADDRESS"

#if [ -z ${ZK} ];
#then
  
#  ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' zkServer.sh start-foreground

#else
  
  echo "server.1=zookeeper1:2888:3888" >> /zookeeper/conf/zoo.cfg
  echo "server.2=zookeeper2:2888:3888" >> /zookeeper/conf/zoo.cfg
  echo "server.3=zookeeper3:2888:3888" >> /zookeeper/conf/zoo.cfg
  echo "$MYID" > /tmp/zookeeper/myid
  
  ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' zkServer.sh start-foreground
#fi
