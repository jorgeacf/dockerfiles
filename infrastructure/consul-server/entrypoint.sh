#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

consul agent -server -bootstrap -ui -config-file /opt/consul/config/configuration.json -client 0.0.0.0