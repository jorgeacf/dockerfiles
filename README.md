# Dockerfiles

This repository contains my dockerfiles to build containers for the most used Big Data Tools.

## List of container images:

*	OS - CentOS - This image contains the latest CentOS image plus the basic development tools.


## Main docker commands

* Docker build

	docker build -t "os_centos:dockerfile" .

* Docker run

	docker run -i -t os_centos:dockerfile /bin/bash

