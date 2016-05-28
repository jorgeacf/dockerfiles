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

## How to use these images

To use these images run the command ```make``` first on the os images and then on the other image with the tool to run in a container.

To run the images run the command ```make run```.