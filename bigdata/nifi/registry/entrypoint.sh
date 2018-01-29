#!/usr/bin/env bash

/opt/nifi-registry/bin/nifi-registry.sh start;

tail -f /dev/null /opt/nifi-registry/logs/*