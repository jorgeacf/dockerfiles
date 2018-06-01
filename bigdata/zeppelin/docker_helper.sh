#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

run () {
	docker run -it \
		-v ~/.ssh:/home/zeppelin/.ssh:Z \
		${REPO}:${VERSION}
}

run-d () {
	docker run -itd \
		-v ~/.ssh:/home/zeppelin/.ssh:Z \
		${REPO}:${VERSION}
}