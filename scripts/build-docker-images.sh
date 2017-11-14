#!/bin/bash

declare -a arr=(
	"build/maven"
	"build/sbt"
	"languages/scala"
	"bigdata/hadoop"
)

docker images

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

for i in "${arr[@]}"
do
   cd "$i"
   make build push
   cd -
done

docker images