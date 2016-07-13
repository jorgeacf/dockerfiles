#!/usr/bin/env bash

N='cassandra'

R=''
for i in {1..3}
do
	if [[ -z "$R" ]]; then
		R="$R$N$i"
	else
		R="$R,$N$i"
	fi
done

echo $R
