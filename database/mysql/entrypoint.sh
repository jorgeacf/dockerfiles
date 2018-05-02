#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

./bin/mysqld_safe --user=mysql &

bash
