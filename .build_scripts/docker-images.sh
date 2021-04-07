#!/bin/bash

declare -a images=(
	"tools/grav"
#	"os/centos"
#	"os/debian"
#	"build/maven"
#	"build/sbt"
#	"build/gradle"
#	"bigdata/hive"
#	"bigdata/nifi"
#	"bigdata/zookeeper"
	"infrastructure/nginx"
	"ci/nexus"
	"ci/jenkins"
)

echo $images