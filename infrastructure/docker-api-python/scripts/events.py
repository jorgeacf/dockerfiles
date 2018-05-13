#!/usr/bin/env python

import docker
import json

client = docker.from_env()

def main():

  for event in client.events():
        json_object = json.loads(event)

        # Debug
        print(json.dumps(json_object, indent=4, sort_keys=True))

      	container = '<Container not found>'
        if 'id' in json_object:
			try:
				container = client.containers.get(json_object['id'])
				if container is not None:

					# Debug
					print(json.dumps(container.attrs, indent=4, sort_keys=True))
					print('=================>' + container.attrs['NetworkSettings']['Networks']['bridge']['IPAddress'])

			except docker.errors.NotFound:
				None

        print('-------------------------------------------')


if __name__== "__main__":
  main()
