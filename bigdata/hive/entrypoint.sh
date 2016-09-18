#!/usr/bin/env bash

hdfs dfs -mkdir /tmp
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/hive
hdfs dfs -mkdir /user/hive/warehouse
hdfs dfs -chmod g+w /tmp
hdfs dfs -chmod g+w /user/hive/warehouse

rm -r -f metastore_db

schematool -dbType derby -initSchema --verbose

hiveserver2 --hiveconf hive.root.logger=INFO,console