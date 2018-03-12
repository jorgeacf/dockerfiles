#!/usr/bin/env bash

echo 'Starting dockerlint...'

dockerlint

dockerfiles=$(find ../ -name "Dockerfile")

status=0;
for d in $dockerfiles; do
	dockerlint $d
	code=$?
	if [ $code -ne 0 ]; then
		status=$code;
	fi
done

echo 'Ending dockerlint...'

exit $status;