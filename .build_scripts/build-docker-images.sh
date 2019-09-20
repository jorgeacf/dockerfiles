#!/bin/bash

TMP=/tmp/.travis_build_logs

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

travis_fold() {
  local action=$1
  local name=$2
  echo -en "travis_fold:${action}:${name}\r"
}

travis_fold_start() {
  travis_fold start $1
  echo $1
  /bin/echo -n $1 > $TMP
}

travis_fold_end() {
  travis_fold end `cat ${TMP}`
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#source "$DIR/docker-images.sh"

images=$($DIR/docker-images.py)

echo "-------"
echo $images
echo "-------"

docker images

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

for i in "${images[@]}"
do
	cd "$i"
	travis_fold_start "$i"
	make build push
	travis_fold_end
	cd -
done

docker images
