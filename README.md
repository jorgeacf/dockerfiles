# Dockerfiles

This repository contains my dockerfiles to build containers for the most used Big Data Tools.

## List of container images:

*	OS - CentOS - This image contains the latest CentOS image plus the basic development tools.
*	OS - Debian - This image contains the latest Debian image plus the basic development tools.
*	OS - Fedora - This image contains the latest Fedora image plus the basic development tools.
*	Hadoop - This image contains Hadoop running as YARN.
*	Mesos - This iamge contains Mesos.
*	Spark - This image contains Spark.
*	HBase - This image contains HBase.
*	Kafka - This image contains Kafka.
*	Zookeeper - This image contains Zookeeper.

## Main docker commands

* Docker build

	docker build -t "os_centos:dockerfile" .

* Docker run

	docker run -i -t os_centos:dockerfile /bin/bash

