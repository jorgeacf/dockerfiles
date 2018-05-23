#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

HOSTNAME=$(hostname)
IPADDRESS=$(hostname -I)

echo "Hostname: $HOSTNAME"
echo "IP: $IPADDRESS"

if [ "$1" = 'zookeeper' ]; then

  MYID=1
  echo "$MYID" > /data/zookeeper/myid
  ZOO_LOG_DIR=/data/logs ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' zkServer.sh start-foreground

fi

exec "$@"


#  echo "server.1=zookeeper1:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
#  echo "server.2=zookeeper2:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
#  echo "server.3=zookeeper3:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
#  echo "$MYID" > /data/zookeeper/myid
#  ZOO_LOG_DIR=/data/logs ZOO_LOG4J_PROP='INFO,CONSOLE,ROLLINGFILE' zkServer.sh start-foreground