#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

run () {
	echo "..."
	docker run -it \
		-v ~/.ssh:/home/user/.ssh:Z \
		${REPO}:${VERSION}
}

run-d () {
	docker run -itd --volume nifi_hadoop_home:/opt/hadoop ${REPO}:${VERSION}
}