#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

if [ "$1" = 'hive' ]; then

	export HADOOP_HOME=/opt/hadoop
	export PATH=$PATH:$HADOOP_HOME/bin

	#hdfs dfs -mkdir /tmp
	#hdfs dfs -mkdir /user
	#hdfs dfs -mkdir /user/hive
	#hdfs dfs -mkdir /user/hive/warehouse
	#hdfs dfs -chmod g+w /tmp
	#hdfs dfs -chmod g+w /user/hive/warehouse

	rm -r -f metastore_db

	/opt/hive/bin/schematool -dbType derby -initSchema --verbose

	/opt/hive/bin/hiveserver2 --hiveconf hive.root.logger=DEBUG,console

	echo "=====END====="
fi

exec "$@"