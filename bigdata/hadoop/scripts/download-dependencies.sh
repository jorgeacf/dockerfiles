#!/bin/bash

VERSION=$1

FILENAME="hadoop-${VERSION}.tar.gz"
INSTALATION_DIR=/opt/hadoop
CACHE_DIR=cache

cd ..
if [ ! -d ${CACHE_DIR} ]; then
	mkdir cache
fi
cd cache

if [ ! -f ${FILENAME} ]; then
	wget -O ${FILENAME} "http://www.apache.org/dyn/closer.lua?filename=hadoop/common/hadoop-${VERSION}/hadoop-${VERSION}.tar.gz&action=download"
fi

if [ ! -d ${INSTALATION_DIR} ]; then
	sudo mkdir -p ${INSTALATION_DIR}
	sudo cp ${FILENAME} ${INSTALATION_DIR}
fi