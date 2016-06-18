#!/bin/bash

echo 'Stoping all containers...'
docker stop $(docker ps -a -q)

echo 'Removing all containers...'
docker rm $(docker ps -a -q)