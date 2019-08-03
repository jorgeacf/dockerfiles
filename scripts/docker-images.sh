#!/bin/bash

declare -a images=(
	"tools/grav"
	"os/centos"
	"os/debian"
	"build/maven"
	"build/sbt"
	"build/gradle"
	"bigdata/hive"
	"bigdata/nifi"
	"infrastructure/nginx"
	"ci/nexus"
)

echo $images