#! /bin/bash -e

echo 'Starting atlas...'

export JAVA_HOME=/usr

echo 'Start HBase...'
/opt/apache-atlas-0.8.2/hbase/bin/start-hbase.sh
echo 'End HBase...'

#/opt/apache-atlas-0.8.2/bin/atlas_start.py -setup

/opt/apache-atlas-0.8.2/bin/atlas_start.py

echo 'Start tail...'
tail -f /opt/apache-atlas-0.8.2/logs/application.log
echo 'End tail...'