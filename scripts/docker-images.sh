#!/bin/bash

declare -a images=(
	"os/centos"
	"os/debian"
	"build/maven"
	"build/sbt"
	"build/gradle"
	"jorgeacf/hive"
	"jorgeacf/nifi"
	"infrastructure/nginx"
	"ci/nexus"
	#"languages/scala"
	#"bigdata/hadoop"
	#"bigdata/zeppelin"
	#"bigdata/zookeeper"
)

echo $images