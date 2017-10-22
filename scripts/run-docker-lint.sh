#!/usr/bin/env bash

dockerfiles=$(find ../ -name "Dockerfile")

for d in $dockerfiles; do
	dockerlint $d
done
