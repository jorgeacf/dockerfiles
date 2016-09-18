#!/usr/bin/env bash

h=`hostname`

# Cassandra node name
N='cassandra'

# String with total cassandra nodes
R=''
for i in {1..$1}
do
	if [[ -z "$R" ]]; then
		R="$R$N$i"
	else
		R="$R,$N$i"
	fi
done

echo $R

sed -i "s/^listen_address: localhost.*/listen_address: ${h}/" /cassandra/conf/cassandra.yaml
sed -i "s/^broadcast_address: localhost.*/broadcast_address: ${h}/" /cassandra/conf/cassandra.yaml
sed -i "s/^broadcast_rpc_address: localhost.*/broadcast_rpc_address: ${h}/" /cassandra/conf/cassandra.yaml

cassandra -R

/bin/bash