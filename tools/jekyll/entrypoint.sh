#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

jekyll serve --watch --incremental  --host=0.0.0.0