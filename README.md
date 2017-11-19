# Dockerfiles

[![Build Status](https://travis-ci.org/jorgeacf/dockerfiles.svg?branch=master)](https://travis-ci.org/jorgeacf/dockerfiles)
[![DockerHub](https://img.shields.io/badge/docker-available-blue.svg)](https://hub.docker.com/u/jorgeacf/)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://raw.githubusercontent.com/jorgeacf/dockerfiles/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/jorgeacf/Dockerfiles.svg)](https://github.com/jorgeacf/Dockerfiles/stargazers) 
[![GitHub forks](https://img.shields.io/github/forks/jorgeacf/Dockerfiles.svg)](https://github.com/jorgeacf/Dockerfiles/network) 


This repository contains my dockerfiles to build containers for the most used Big Data Tools.

| Docker Container      | Docker Hub Build Status and URL                           | Image Size
| :------------------------------------  | :----------------------------------------| :--------------
| Zookeeper    	| [good](https://registry.hub.docker.com/u/jorgeacf/zookeeper)  	| [![](https://images.microbadger.com/badges/image/jorgeacf/zookeeper.svg)](https://microbadger.com/images/jorgeacf/zookeeper "Get your own image badge on microbadger.com")
| Hadoop    	| [good](https://registry.hub.docker.com/u/jorgeacf/hadoop)  		| [![](https://images.microbadger.com/badges/image/jorgeacf/hadoop.svg)](https://microbadger.com/images/jorgeacf/hadoop "Get your own image badge on microbadger.com")
| Spark    		| [good](https://registry.hub.docker.com/u/jorgeacf/spark) 			| [![](https://images.microbadger.com/badges/image/jorgeacf/spark.svg)](https://microbadger.com/images/jorgeacf/spark "Get your own image badge on microbadger.com")
| HBase    		| [good](https://registry.hub.docker.com/u/jorgeacf/hbase) 			| [![](https://images.microbadger.com/badges/image/jorgeacf/hbase.svg)](https://microbadger.com/images/jorgeacf/hbase "Get your own image badge on microbadger.com")
| Hive    		| [good](https://registry.hub.docker.com/u/jorgeacf/hive) 			| [![](https://images.microbadger.com/badges/image/jorgeacf/hive.svg)](https://microbadger.com/images/jorgeacf/hive "Get your own image badge on microbadger.com")
| Kafka    		| [good](https://registry.hub.docker.com/u/jorgeacf/kafka) 			| [![](https://images.microbadger.com/badges/image/jorgeacf/kafka.svg)](https://microbadger.com/images/jorgeacf/kafka "Get your own image badge on microbadger.com")
| Hue    		| [good](https://registry.hub.docker.com/u/jorgeacf/hue) 			| [![](https://images.microbadger.com/badges/image/jorgeacf/hue.svg)](https://microbadger.com/images/jorgeacf/hue "Get your own image badge on microbadger.com")
| Jenkins   	| [good](https://registry.hub.docker.com/u/jorgeacf/jenkins) 		| [![](https://images.microbadger.com/badges/image/jorgeacf/jenkins.svg)](https://microbadger.com/images/jorgeacf/jenkins "Get your own image badge on microbadger.com")
| Nexus    		| [good](https://registry.hub.docker.com/u/jorgeacf/nexus) 			| [![](https://images.microbadger.com/badges/image/jorgeacf/nexus.svg)](https://microbadger.com/images/jorgeacf/nexus "Get your own image badge on microbadger.com")

## List of container images:

*	CentOS - Latest CentOS image plus the basic development tools.
*	Debian - Latest Debian image plus the basic development tools.
*	Fedora - Latest Fedora image plus the basic development tools.
*	Cassandra
*	Drill
*	Flink
*	Hadoop
*	HBase
*	Hive
*	Hue
*	Kafka
*	Mesos
*	Spark
*	Zookeeper
*	Jenkins
*	Nexus

## How to build these Docker images

Each docker image can be build using ```make build``` from the root directory of that image.

To build all images run ```make build``` from the root directory of this repository.

## How to use these images

Run ```make``` in the root directory the image to run to see the options. e.g.

```
jorgeacf at localhost in ~/dev/dockerfiles/bigdata/hadoop on develop [!]
$ make

This is the make help for Apache Hadoop (2.7.2) docker image

  Run 'make build' to build the Hadoop docker image.
  Run 'make run-multi slaves=n' to start Hadoop with n slaves.
  Run 'make clean' to clean all Hadoop containers.

```
