#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x


while [ true ]
do
	git add .
	git commit -m "Updated flows..."

    latest_local_commit=$(git log -n 1 --pretty=format:"%H")
	latest_remote_commit=$(git log -n 1 origin/develop --pretty=format:"%H")

	if [ "$latest_local_commit" != "$latest_remote_commit" ]
	then
		git push origin develop
	fi

    sleep 5
done