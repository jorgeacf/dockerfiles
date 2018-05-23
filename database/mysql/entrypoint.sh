#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

if [ "$1" = 'mysql' ]; then

	./scripts/create_database.sh

    ./bin/mysqld_safe --user=mysql
fi

exec "$@"