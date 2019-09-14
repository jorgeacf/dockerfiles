#!/bin/bash

NAMESPACE=jorgeacf
REPO=build-on-docker
DOCKER_CLIENT_VERSION=$(docker version --format '{{.Client.Version}}')

docker build \
	-t ${NAMESPACE}/${REPO}:${DOCKER_CLIENT_VERSION} \
	-f Dockerfile.build \
	--build-arg VERSION=$DOCKER_CLIENT_VERSION .

docker run --rm -it \
    -v $HOME/dev/github:/github \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /github/dockerfiles \
    ${NAMESPACE}/${REPO}:${DOCKER_CLIENT_VERSION} sh