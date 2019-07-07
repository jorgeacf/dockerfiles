#!/usr/bin/env bash

echo 'Starting dockerlint...'

dockerlint -h

dockerfiles=$(find ../ -name "Dockerfile")

status=0;
for d in $dockerfiles; do
	echo "In directory [$(pwd)][$(d)]"
	dockerlint $d
	code=$?
	if [ $code -ne 0 ]; then
		status=$code;
	fi
done

echo 'Ending dockerlint...'

exit $status;