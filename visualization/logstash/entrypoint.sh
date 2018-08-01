#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

logstash -f /opt/logstash/config/logstash.conf

bash