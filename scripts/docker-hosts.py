#!/usr/bin/env python

import docker
import json

client = docker.from_env()

# /etc/hosts 127.0.0.1 localhost

def list_containers():

	containers = {}

	for container in client.containers.list():
		if 'jorgeacf' in container.image.tags[0]:
			image_name = container.image.tags[0].replace('jorgeacf/', '')
			name = image_name.split(':')[0]
			version = image_name.split(':')[1]
			ip = container.attrs['NetworkSettings']['IPAddress']

			if name in containers:
 				containers[name] = containers[name] + [ip]
 			else:
 				containers[name] = [ip]

	return containers

def print_containers(containers):

	containers_ips = ''
	for container_name in containers:
		number = 1
		for ip in containers[container_name]:
			containers_ips += ip + ' ' + container_name + str(number) + '\n'
			number += 1
	return containers_ips


def write_hosts():

	containers = list_containers()
	hosts_file = open("/etc/hosts", "w")
	hosts_file.write("127.0.0.1 localhost\n")
	hosts_file.write(print_containers(containers))
	hosts_file.close()

def main():

	count = 1

	for event in client.events():
		if 'start' in event:
			print(event)
			print('---->' + str(count))
			count += 1

if __name__== "__main__":
	main()