#!/usr/bin/env bash

MYID=${1:-1}
ZK=$2

echo $MYID
echo $ZK

HOSTNAME=$(hostname)
IPADDRESS=$(hostname -I)

if [ -n "$ZK" ] 
then
  echo "`/zookeeper/bin/zkCli.sh -server $ZK:2181 get /zookeeper/config|grep ^server`" >> /zookeeper/conf/zoo.cfg.dynamic
  echo "server.$MYID=$IPADDRESS:2888:3888:observer;2181" >> /tmp/zookeeper/conf/zoo.cfg.dynamic
  cp /zookeeper/conf/zoo.cfg.dynamic /tmp/zookeeper/conf/zoo.cfg.dynamic.org
  #/zookeeper/bin/zkServer-initialize.sh --force --myid=$MYID
  ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' /zookeeper/bin/zkServer.sh start
  /zookeeper/bin/zkCli.sh -server $ZK:2181 reconfig -add "server.$MYID=$IPADDRESS:2888:3888:participant;2181"
  /zookeeper/bin/zkServer.sh stop
  ZOO_LOG_DIR=/var/log ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' /zookeeper/bin/zkServer.sh start-foreground
else
  echo "server.1=172.17.0.2:2888:3888" >> /zookeeper/conf/zoo.cfg
  echo "server.2=172.17.0.3:2888:3888" >> /zookeeper/conf/zoo.cfg
  echo "server.3=172.17.0.4:2888:3888" >> /zookeeper/conf/zoo.cfg
  echo "$MYID" > /tmp/zookeeper/myid
  #zkServer-initialize.sh --force --myid=$MYID
  /zookeeper/bin/zkServer.sh start-foreground
fi
