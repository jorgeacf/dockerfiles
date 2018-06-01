#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

eval $(ssh-agent -s)

ssh-add ~/.ssh/id_rsa

#mkdir /home/jorgeacf && chown -R jorgeacf /home/jorgeacf

#pwd;
#cd /home/jorgeacf;
#pwd;

#ls -al /home;

#git clone git@github.com:jorgeacf/zeppelin-notebooks.git

bash