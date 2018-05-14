#!/usr/bin/env python

import docker
import json
import consul
import logging


logging.basicConfig(level=logging.INFO,
                    format='[%(levelname)s] %(asctime)s (%(threadName)-10s) %(message)s',
                    )

# Configuration
consul_host = '172.17.0.2'


client = docker.from_env()
consul = consul.Consul(host=consul_host)

# Entities
class ContainerMetadata:
	def __init__(self, id, short_id, name, image_name, version, ip):
		self.id = id
		self.short_id = short_id
		self.name = name
		self.image_name = image_name
		self.version = version
		self.ip = ip

def add_new_container(containers, event):
	event_json = json.loads(event)
	container = client.containers.get(event_json['id'])

	image_name = container.image.tags[0].replace('jorgeacf/', '')
	name = image_name.split(':')[0]
	version = image_name.split(':')[1]
	ip = container.attrs['NetworkSettings']['IPAddress']

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

	logging.info('Starting container ' + container_name)

	# Regist container on consul
	consul.catalog.register(container_name, address=ip)

	return new_container

def remove_container(containers, event):
	event_json = json.loads(event)
	container = client.containers.get(event_json['id'])

	image_name = container.image.tags[0].replace('jorgeacf/', '')
	name = image_name.split(':')[0]

	#consul.catalog.deregister(name)
	#for key, value in containers.iteritems():
	#	for item in value:
	#		print(item.id)

	if name in containers:
		for container in containers[name]:
			if container.id == event_json['id']:
				for node in consul.catalog.nodes()[1]:
					if node['Address'] == container.ip:
						consul.catalog.deregister(node['Node'])
						logging.info('Stoping container ' + node['Node'])

	containers[name] = [c for c in containers[name] if c.id != event_json['id']]


def list_containers(containers):

	for container in client.containers.list():
		if 'jorgeacf' in container.image.tags[0]:
			image_name = container.image.tags[0].replace('jorgeacf/', '')
			name = image_name.split(':')[0]
			version = image_name.split(':')[1]
			ip = container.attrs['NetworkSettings']['IPAddress']

			new_container = ContainerMetadata(container.id, container.short_id, container.name, name, version, ip)
			if name in containers:
				containers[name] = containers[name] + [new_container]
			else:
				containers[name] = [new_container]

			container_name = name
			number_of_containers = len(containers[name])
			#if number_of_containers > 1:
			container_name += str(number_of_containers)

			logging.info('Listing container ' + container_name)

			# Regist container on consul
			consul.catalog.register(container_name, address=ip)

def clear_hosts():

	for node in consul.catalog.nodes()[1]:
		consul.catalog.deregister(node['Node'])

def main():

	logging.info('Main start...')

	containers = {}

	clear_hosts()
	list_containers(containers)

	for event in client.events():
		event_json = json.loads(event)

		if 'status' in event_json:
			if 'start' == event_json['status']:
				try:
					add_new_container(containers, event)
				except:
					log.error('Can''t add new container... [' + event + ']')

			if 'stop' == event_json['status']:
				try:
					remove_container(containers, event)
				except:
					log.error('Can''t remove container... [' + event + ']')

	logging.info('Main end...')


if __name__== "__main__":
  main()
