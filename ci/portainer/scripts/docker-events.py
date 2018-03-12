#!/usr/bin/env python

from threading import Thread
import docker
import json
import logging


logging.basicConfig(level=logging.ERROR,
                    format='[%(levelname)s] (%(threadName)-10s) %(message)s',
                    )

global client

client = docker.from_env()

# /etc/hosts 127.0.0.1 localhost

class ContainerMetadata:
	def __init__(self, id, short_id, name, image_name, version, ip):
		self.id = id
		self.short_id = short_id
		self.name = name
		self.image_name = image_name
		self.version = version
		self.ip = ip

def print_containers(containers):

	containers_ips = ''
	for container_name in containers:
		container_number = 1
		number_of_containers = len(containers[container_name])
		for container_metadata in containers[container_name]:
			image_container_name = container_metadata.image_name
			if number_of_containers > 1:
				image_container_name += str(container_number)
			host_format = '{0} {1} {2} {3}\n'
			host = host_format.format(container_metadata.ip, image_container_name, container_metadata.name, container_metadata.short_id)
			containers_ips += host
			container_number += 1
	return containers_ips

def write_hosts(containers):
	hosts_file = open("/etc/hosts", "w")
	hosts_file.write("127.0.0.1 localhost\n")
	hosts_file.write(print_containers(containers))
	hosts_file.close()

def add_new_container(containers, event):
	event_json = json.loads(event)
	container = client.containers.get(event_json['id'])

	print('Starting container ' + event_json['id'])

	image_name = container.image.tags[0].replace('jorgeacf/', '')
	name = image_name.split(':')[0]
	version = image_name.split(':')[1]
	ip = container.attrs['NetworkSettings']['IPAddress']

	new_container = ContainerMetadata(container.id, container.short_id, container.name, name, version, ip)
	if name in containers:
		containers[name] = containers[name] + [new_container]
	else:
		containers[name] = [new_container]
	return new_container

def remove_container(containers, event):
	event_json = json.loads(event)
	container = client.containers.get(event_json['id'])

	print('Stoping container ' + event_json['id'])

	image_name = container.image.tags[0].replace('jorgeacf/', '')
	name = image_name.split(':')[0]

	#for key, value in containers.iteritems():
	#	for item in value:
	#		print(item.id)

	if name in containers:
		containers[name] = [c for c in containers[name] if c.id != event_json['id']]

def list_containers(containers):

	for container in client.containers.list():
		if 'jorgeacf' in container.image.tags[0]:
			image_name = container.image.tags[0].replace('jorgeacf/', '')
			name = image_name.split(':')[0]
			version = image_name.split(':')[1]
			ip = container.attrs['NetworkSettings']['IPAddress']

			print('List - Name: ' + name)

			new_container = ContainerMetadata(container.id, container.short_id, container.name, name, version, ip)
			if name in containers:
				containers[name] = containers[name] + [new_container]
			else:
				containers[name] = [new_container]

def update_containers_hosts(containers):
	for container_type in containers:
		for container_name in containers[container_type]:
			container = client.containers.get(container_name.id)
			hosts = print_containers(containers)
			command = 'echo "### BEGIN DOCKER CONTAINER HOSTS\n' + hosts + '### END DOCKER CONTAINER HOSTS" > /etc/hosts'
			container.exec_run(['sh', '-c', command])


def main():

	print('Main start...')

	containers = {}

	list_containers(containers)

	for event in client.events():
		event_json = json.loads(event)

		if 'status' in event_json:
			if 'start' == event_json['status']:
				add_new_container(containers, event)
				update_containers_hosts(containers)
				write_hosts(containers)

			if 'kill' == event_json['status']:
				remove_container(containers, event)
				write_hosts(containers)

	print('Main end...')

if __name__== "__main__":
	main()
