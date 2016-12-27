#!/usr/bin/env bash

echo 'Cleaning zookeeper...'
#echo 'rmr /hbase' | /opt/zookeeper/bin/zkCli.sh -server zookeeper1:2181

echo 'Cleaning HDFS...'
#hdfs dfs -rm -r /hbase

echo 'Cleaning HBase containers...'
docker rm -f hbase-master
docker rm -f hbase-region-server1
docker rm -f hbase-region-server2
docker rm -f hbase-region-server3

cd /home/jorgeacf/dev/github/dockerfiles/bigdata/hbase

make build
make run-multi region-servers=3

cd -