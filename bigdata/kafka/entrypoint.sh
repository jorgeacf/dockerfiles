#!/usr/bin/env bash

h=`hostname`
i=$((${#str}-1))
id=${h:$i:1}

sed -i "s/^broker.id=0.*/broker.id=${id}/" /kafka/config/server.properties
sed -i "s/^advertised.host.name=.*/advertised.host.name=${h}/" /kafka/config/server.properties
sed -i "s/^host.name=.*/host.name=${h}/" /kafka/config/server.properties

#/kafka/bin/zookeeper-server-start.sh /kafka/config/zookeeper.properties &
#sleep 10;
#echo "------- Starting HTTP ---------"
#cd kafka-topics-ui
#http-server -p 8080 . & 

echo "------- Starting Kafka --------"
/kafka/bin/kafka-server-start.sh /kafka/config/server.properties


