#!/usr/bin/env python

import docker
import json
import consul
import logging


logging.basicConfig(filename='/var/log/docker-events/docker-events-hosts-file.log',
					level=logging.INFO,
                    format=' [%(levelname)s] %(asctime)s (%(threadName)-10s) %(message)s')

client = docker.from_env()

# Entities
class ContainerMetadata:
	def __init__(self, id, short_id, name, image_name, version, ip):
		self.id = id
		self.short_id = short_id
		self.name = name
		self.image_name = image_name
		self.version = version
		self.ip = ip
		
	def toJSON(self):
		return json.dumps(self, default=lambda o: o.__dict__, sort_keys=True, indent=4)


def print_containers(containers):

	containers_ips = ''
	for container_name in containers:
		container_number = 1
		number_of_containers = len(containers[container_name])
		for container_metadata in containers[container_name]:
			image_container_name = container_metadata.image_name
			host_format = '{0} {1}\n'

			if number_of_containers == 1:
				host = host_format.format(container_metadata.ip, image_container_name)
				containers_ips += host

				image_container_name += str(container_number)
				host = host_format.format(container_metadata.ip, image_container_name)
				containers_ips += host
			else:
				image_container_name += str(container_number)
				host = host_format.format(container_metadata.ip, image_container_name)
				containers_ips += host
			
			container_number += 1
	return containers_ips

def write_hosts(containers):
	hosts_file = open("/hosts/docker-hosts", "w")
	hosts_file.write(print_containers(containers))
	hosts_file.close()


def add_new_container(containers, event):
	event_json = json.loads(event)
	container = client.containers.get(event_json['id'])

	image_name = container.image.tags[0].replace('jorgeacf/', '')
	name = image_name.split(':')[0]
	version = image_name.split(':')[1]
	#ip = container.attrs['NetworkSettings']['IPAddress']
	first_network_name = list(container.attrs['NetworkSettings']['Networks'])[0]
	ip = container.attrs['NetworkSettings']['Networks'][first_network_name]['IPAddress']

	# Add container to the list
	new_container = ContainerMetadata(container.id, container.short_id, container.name, name, version, ip)
	if name in containers:
		containers[name] = containers[name] + [new_container]
	else:
		containers[name] = [new_container]

	container_name = name
	number_of_containers = len(containers[name])
	#if number_of_containers > 1:
	container_name += str(number_of_containers)

	logging.info('Starting container name=[' + container_name + '], ip=[' + ip + '], object=[\n' + new_container.toJSON() + ']')

	return new_container

def remove_container(containers, event):
	event_json = json.loads(event)
	container = client.containers.get(event_json['id'])

	image_name = container.image.tags[0].replace('jorgeacf/', '')
	name = image_name.split(':')[0]

	if name in containers:
		for container in containers[name]:
			if container.id == event_json['id']:
				for node in consul.catalog.nodes()[1]:
					if node['Address'] == container.ip:
						#consul.catalog.deregister(node['Node'])
						logging.info('Stoping container ' + node['Node'])

	containers[name] = [c for c in containers[name] if c.id != event_json['id']]


def list_containers(containers):

	for container in client.containers.list():
		if 'jorgeacf' in container.image.tags[0]:
			image_name = container.image.tags[0].replace('jorgeacf/', '')
			name = image_name.split(':')[0]
			version = image_name.split(':')[1]
			#ip = container.attrs['NetworkSettings']['IPAddress']
			first_network_name = list(container.attrs['NetworkSettings']['Networks'])[0]
			ip = container.attrs['NetworkSettings']['Networks'][first_network_name]['IPAddress']

			new_container = ContainerMetadata(container.id, container.short_id, container.name, name, version, ip)
			if name in containers:
				containers[name] = containers[name] + [new_container]
			else:
				containers[name] = [new_container]

			container_name = name
			number_of_containers = len(containers[name])
			#if number_of_containers > 1:
			container_name += str(number_of_containers)

			logging.info('Listing container name=[' + container_name + '], ip=[' + ip + '], object=[\n' + new_container.toJSON() + ']')


def main():

	logging.info('Main start...')

	containers = {}

	list_containers(containers)
	write_hosts(containers)

	for event in client.events():
		event_json = json.loads(event)

		if 'status' in event_json:
			if 'start' == event_json['status']:
				try:
					containers = {}
					list_containers(containers)
					write_hosts(containers)
				except Exception as exception:
					logging.error('Can''t add new container... [' + event + ']')
					raise

			if 'stop' == event_json['status']:
				try:
					containers = {}
					list_containers(containers)
					write_hosts(containers)
				except Exception as exception:
					logging.error('Can''t remove container... [' + event + ']')
					raise

	logging.info('Main end...')


if __name__== "__main__":
  main()
