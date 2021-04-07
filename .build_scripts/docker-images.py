#!/usr/bin/env python3

import os
import os.path
from git import Repo

CURRENT_DIR=os.getcwd()
SCRIPT_DIR=os.path.dirname(os.path.realpath(__file__))

repo = Repo(os.getcwd())

hcommit = repo.head.commit

docker_directories_changed=[]

for diff_added in hcommit.diff('HEAD~1'):
	path=diff_added.a_path
	path_segments=path.split('/')[:-1]
	sub_path='/'.join(path_segments)

	if(sub_path not in docker_directories_changed and os.path.exists(sub_path + '/Dockerfile')):
		docker_directories_changed.append(sub_path)
		print(sub_path)