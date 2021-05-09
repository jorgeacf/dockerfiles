#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x


superset run -p 8080 --host 0.0.0.0 --with-threads --reload --debugger