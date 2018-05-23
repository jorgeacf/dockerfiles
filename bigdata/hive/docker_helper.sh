#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

run () {
	docker run -it --volume nifi_hadoop_home:/opt/hadoop ${REPO}:${VERSION}
}

run-d () {
	docker run -itd --volume nifi_hadoop_home:/opt/hadoop ${REPO}:${VERSION}
}