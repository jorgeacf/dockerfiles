#!/usr/bin/env bash

mesos slave --master=zk://zookeeper1:2181/mesos --log_dir=/tmp/mesos-slave-logs

/bin/bash