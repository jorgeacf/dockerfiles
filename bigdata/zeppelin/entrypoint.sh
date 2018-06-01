#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

if [ "$1" = 'zeppelin' ]; then

	eval $(ssh-agent -s)

	ssh-add ~/.ssh/id_rsa

	git config --global user.email "jorgefigueiredo@outlook.com"
	git config --global user.name "Jorge Figueiredo"

	git clone git@github.com:jorgeacf/zeppelin-notebooks.git /opt/zeppelin/notebook

	cd /opt/zeppelin/notebook

	git checkout develop

	git-changes-commit.sh &
	#ln -s -f ../../hooks/post-commit .git/hooks/post-commit

	cd -

	export HADOOP_HOME=/opt/hadoop
	export PATH=$PATH:$HADOOP_HOME/bin

	zeppelin-daemon.sh start

	tail -f /opt/zeppelin/logs/*.log

	echo "Exiting..."
fi

exec "$@"