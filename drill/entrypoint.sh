#!/usr/bin/env bash

echo 'At the entrypoint file...'

/drill/bin/drillbit.sh start && sleep 2 && tail -f /drill/log/*