#!/usr/bin/env python

import docker
import json

client = docker.from_env()

def main():

  for event in client.events():
        json_object = json.loads(event)
        print(json.dumps(json_object, indent=4, sort_keys=True))
        print('-------------------------------------------')


if __name__== "__main__":
  main()
