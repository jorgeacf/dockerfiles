#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

ACTION=${1:-print_env}
IMAGE_NAME=${2:-X}

ROOT_DIR=$(pwd)
IMAGE_DIR=$(find . -maxdepth 2 -type d -print | grep -m1 $IMAGE_NAME)
VERSION=$(cat ${IMAGE_DIR}/VERSION)
IFS='/' read -r -a array <<< "$IMAGE_DIR"
REPO="jorgeacf/${array[-1]}"

print_env () {
	echo ""
	echo "ACTION=[$ACTION]"
	echo "IMAGE_NAME=[$IMAGE_NAME]"
	echo "ROOT_DIR=[$ROOT_DIR]"
	echo "IMAGE_DIR=[$IMAGE_DIR]"
	echo "VERSION=[$VERSION]"
	echo "REPO=[$REPO]"
	echo ""
}

build () {
	docker build -t ${REPO}:${VERSION} .
}

run () {
	docker run -it ${REPO}:${VERSION}
}

run-d () {
	docker run -itd ${REPO}:${VERSION}
}

FILE="${IMAGE_DIR}/docker_helper.sh"
if [ -e "$FILE" ]; then
   source ${IMAGE_DIR}/docker_helper.sh
fi

print_env

cd ${IMAGE_DIR}
"$@"
cd ${ROOT_DIR} >> /dev/null