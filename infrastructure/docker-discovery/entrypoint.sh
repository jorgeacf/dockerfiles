#!/usr/bin/env bash

#set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

#echo "Starting docker-events-consul..."
#python /scripts/docker-events-consul.py &

#echo "Starting docker-events-hosts..."
#python /scripts/docker-events-hosts.py &

echo "Starting writing docker hosts to shared volume..."
python /scripts/docker-events-hosts-file.sh &

sleep 3;
tail -f /var/log/docker-events/*.log
