#!/usr/bin/env python

from subprocess import call

#call(["ls", "-l"])

#call(["docker", "ps", "-a"])


#print(call(["exit 1"], shell=True))

#print(call(["exit 0"], shell=True))



import yaml

with open("docker-images.yaml", 'r') as stream:
    try:
        y=yaml.load(stream)
        print(y[0]['name'])
        #print(y)
    except yaml.YAMLError as exc:
        print(exc)