# Dockerfiles

[![DockerHub](https://img.shields.io/badge/docker-available-blue.svg)](https://hub.docker.com/u/jorgeacf/)

This repository contains my dockerfiles to build containers for the most used Big Data Tools.

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

| Docker Container      | Docker Hub Build Status and URL                           | Image Size
| :------------------------------------  | :-----------------------------------------                | :--------------
| Zookeeper    | [good](https://registry.hub.docker.com/u/jorgeacf/zookeeper)  | [![](https://images.microbadger.com/badges/image/jorgeacf/zookeeper.svg)](https://microbadger.com/images/jorgeacf/zookeeper "Get your own image badge on microbadger.com")
| Hadoop    | [good](https://registry.hub.docker.com/u/jorgeacf/hadoop)  | [![](https://images.microbadger.com/badges/image/jorgeacf/hadoop.svg)](https://microbadger.com/images/jorgeacf/hadoop "Get your own image badge on microbadger.com")

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
