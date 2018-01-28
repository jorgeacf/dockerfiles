#!/usr/bin/env bash

#/opt/nifi/bin/nifi.sh run

/opt/nifi/bin/nifi.sh start;

tail -f /dev/null /opt/nifi/logs/*