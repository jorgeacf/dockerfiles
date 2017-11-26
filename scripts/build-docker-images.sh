#!/bin/bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DIR/docker-images.sh"

docker images

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

for i in "${images[@]}"
do
   cd "$i"
   make build push
   cd -
done

docker images