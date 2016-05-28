#!/usr/bin/env bash

export JAVA_HOME="${JAVA_HOME:-/usr}"

/hadoop/sbin/start-dfs.sh
/hadoop/sbin/start-yarn.sh
tail -f /hadoop/logs/*
/hadoop/sbin/stop-yarn.sh
/hadoop/sbin/stop-dfs.sh