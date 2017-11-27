# Jorge Figueiredo - Dockerfiles

[![Build Status](https://travis-ci.org/jorgeacf/dockerfiles.svg?branch=master)](https://travis-ci.org/jorgeacf/dockerfiles)
[![DockerHub](https://img.shields.io/badge/docker-available-blue.svg)](https://hub.docker.com/u/jorgeacf/)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://raw.githubusercontent.com/jorgeacf/dockerfiles/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/jorgeacf/Dockerfiles.svg)](https://github.com/jorgeacf/Dockerfiles/stargazers) 
[![GitHub forks](https://img.shields.io/github/forks/jorgeacf/Dockerfiles.svg)](https://github.com/jorgeacf/Dockerfiles/network) 


This repository contains my dockerfiles to build containers for the most used Big Data Tools.

| Image Type | Docker Container   | Image Size       | Latest Version 
| :--------: | :----------------: | :--------------: | :---------------: |
| Big Data   | Cassandra		  | [![](https://images.microbadger.com/badges/image/jorgeacf/cassandra.svg)](https://microbadger.com/images/jorgeacf/cassandra "Cassandra")    | [![](https://images.microbadger.com/badges/version/jorgeacf/cassandra.svg)](https://microbadger.com/images/jorgeacf/cassandra "Cassandra")
| Big Data   | Drill		      | [![](https://images.microbadger.com/badges/image/jorgeacf/drill.svg)](https://microbadger.com/images/jorgeacf/drill "Drill")				| [![](https://images.microbadger.com/badges/version/jorgeacf/drill.svg)](https://microbadger.com/images/jorgeacf/drill "Drill")
| Big Data   | Flink			  | [![](https://images.microbadger.com/badges/image/jorgeacf/flink.svg)](https://microbadger.com/images/jorgeacf/flink "Flink")				| [![](https://images.microbadger.com/badges/version/jorgeacf/flink.svg)](https://microbadger.com/images/jorgeacf/flink "Flink")
| Big Data   | Hadoop    	      | [![](https://images.microbadger.com/badges/image/jorgeacf/hadoop.svg)](https://microbadger.com/images/jorgeacf/hadoop "Hadoop")			    | [![](https://images.microbadger.com/badges/version/jorgeacf/hadoop.svg)](https://microbadger.com/images/jorgeacf/hadoop "Hadoop")
| Big Data   | HBase    		  | [![](https://images.microbadger.com/badges/image/jorgeacf/hbase.svg)](https://microbadger.com/images/jorgeacf/hbase "HBase")				| [![](https://images.microbadger.com/badges/version/jorgeacf/hbase.svg)](https://microbadger.com/images/jorgeacf/hbase "HBase")
| Big Data   | Hive    		      | [![](https://images.microbadger.com/badges/image/jorgeacf/hive.svg)](https://microbadger.com/images/jorgeacf/hive "Hive")				    | [![](https://images.microbadger.com/badges/version/jorgeacf/hive.svg)](https://microbadger.com/images/jorgeacf/hive "Hive")
| Big Data   | Hue    		      | [![](https://images.microbadger.com/badges/image/jorgeacf/hue.svg)](https://microbadger.com/images/jorgeacf/hue "Hue")					    | [![](https://images.microbadger.com/badges/version/jorgeacf/hue.svg)](https://microbadger.com/images/jorgeacf/hue "Hue")
| Big Data   | Kafka    		  | [![](https://images.microbadger.com/badges/image/jorgeacf/kafka.svg)](https://microbadger.com/images/jorgeacf/kafka "Kafka")				| [![](https://images.microbadger.com/badges/version/jorgeacf/kafka.svg)](https://microbadger.com/images/jorgeacf/kafka "Kafka")
| Big Data   | Mesos			  | [![](https://images.microbadger.com/badges/image/jorgeacf/mesos.svg)](https://microbadger.com/images/jorgeacf/mesos "Mesos") 				| [![](https://images.microbadger.com/badges/version/jorgeacf/mesos.svg)](https://microbadger.com/images/jorgeacf/mesos "Mesos")
| Big Data   | Spark    		  | [![](https://images.microbadger.com/badges/image/jorgeacf/spark.svg)](https://microbadger.com/images/jorgeacf/spark "Spark")				| [![](https://images.microbadger.com/badges/version/jorgeacf/spark.svg)](https://microbadger.com/images/jorgeacf/spark "Spark")
| Big Data   | Zeppelin			  | [![](https://images.microbadger.com/badges/image/jorgeacf/zeppelin.svg)](https://microbadger.com/images/jorgeacf/zeppelin "Zeppelin")  		| [![](https://images.microbadger.com/badges/version/jorgeacf/zeppelin.svg)](https://microbadger.com/images/jorgeacf/zeppelin "Zeppelin")
| Big Data   | Zookeeper    	  | [![](https://images.microbadger.com/badges/image/jorgeacf/zookeeper.svg)](https://microbadger.com/images/jorgeacf/zookeeper "Zookeeper")  	| [![](https://images.microbadger.com/badges/version/jorgeacf/zookeeper.svg)](https://microbadger.com/images/jorgeacf/zookeeper "Zookeeper")
| Build      | Maven			  | [![](https://images.microbadger.com/badges/image/jorgeacf/maven.svg)](https://microbadger.com/images/jorgeacf/maven "Maven")				| [![](https://images.microbadger.com/badges/version/jorgeacf/maven.svg)](https://microbadger.com/images/jorgeacf/maven "Maven")
| Build      | SBT				  | [![](https://images.microbadger.com/badges/image/jorgeacf/sbt.svg)](https://microbadger.com/images/jorgeacf/sbt "SBT")						| [![](https://images.microbadger.com/badges/version/jorgeacf/sbt.svg)](https://microbadger.com/images/jorgeacf/sbt "SBT")
| CI         | Jenkins   	      | [![](https://images.microbadger.com/badges/image/jorgeacf/jenkins.svg)](https://microbadger.com/images/jorgeacf/jenkins "Jenkins")			| [![](https://images.microbadger.com/badges/version/jorgeacf/jenkins.svg)](https://microbadger.com/images/jorgeacf/jenkins "Jenkins")
| CI         | Nexus    		  | [![](https://images.microbadger.com/badges/image/jorgeacf/nexus.svg)](https://microbadger.com/images/jorgeacf/nexus "Nexus")				| [![](https://images.microbadger.com/badges/version/jorgeacf/nexus.svg)](https://microbadger.com/images/jorgeacf/nexus "Nexus")
| Languages  | Node.js 			  | [![](https://images.microbadger.com/badges/image/jorgeacf/nodejs.svg)](https://microbadger.com/images/jorgeacf/nodejs "Node.js")			| [![](https://images.microbadger.com/badges/version/jorgeacf/nodejs.svg)](https://microbadger.com/images/jorgeacf/nodejs "Node.js")
| Languages  | Scala			  | [![](https://images.microbadger.com/badges/image/jorgeacf/scala.svg)](https://microbadger.com/images/jorgeacf/scala "Scala")				| [![](https://images.microbadger.com/badges/version/jorgeacf/scala.svg)](https://microbadger.com/images/jorgeacf/scala "Scala")


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
