#! /bin/bash -e

echo 'Starting atlas....'

export JAVA_HOME=/usr

/opt/apache-atlas-0.8.2/hbase/bin/start-hbase.sh

/opt/apache-atlas-0.8.2/bin/atlas_start.py

#bin/atlas_start.py -setup

sleep 100m;

echo 'end...'