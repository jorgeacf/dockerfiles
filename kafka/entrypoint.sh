#!/usr/bin/env bash

/kafka/bin/zookeeper-server-start.sh /kafka/config/zookeeper.properties &
sleep 10;
echo "------- Starting Kafka --------"
/kafka/bin/kafka-server-start.sh /kafka/config/server.properties