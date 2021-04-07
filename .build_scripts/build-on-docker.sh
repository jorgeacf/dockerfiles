#!/bin/bash

NAMESPACE=jorgeacf
REPO=build-on-docker
DOCKER_CLIENT_VERSION=$(docker version --format '{{.Client.Version}}')

CURRENT_DIR=$PWD
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Parameters: [$@]"

docker build \
	-t ${NAMESPACE}/${REPO}:${DOCKER_CLIENT_VERSION} \
	-f ${SCRIPT_DIR}/cd Dockerfile.build \
	--build-arg VERSION=$DOCKER_CLIENT_VERSION .

docker run --rm -it \
    -v $HOME/dev/github:/github \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /github/dockerfiles \
    ${NAMESPACE}/${REPO}:${DOCKER_CLIENT_VERSION} sh -c "cd $1 && make $2"