#!/usr/bin/env bash

mkdir -p /zookeeper/data /zookeeper/wal /zookeeper/log
mkdir -p /tmp/zookeeper

if [ -n "$ZOO_SERVERS" ]; then
	
	h=`hostname`
 	i=$((${#str}-1))		
 	echo ${h:$i:1} > /tmp/zookeeper/myid
	#echo $ZOO_SERVER_ID > /tmp/zookeeper/myid

	IFS=\, read -a servers <<<"$ZOO_SERVERS"
	for i in "${!servers[@]}"; do 
		printf "\nserver.%i=%s:2888:3888" "$((1 + $i))" "${servers[$i]}" >> /zookeeper/conf/zoo.cfg
	done
	echo '' >> /zookeeper/conf/zoo.cfg
fi

sleep 10
echo '==========================================='
echo '   Starting Zookeeper server...            '
echo '==========================================='

zkServer.sh start-foreground
