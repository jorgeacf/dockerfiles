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


def print_containers(containers):

	containers_ips = ''
	for container_name in containers:
		container_number = 1
		number_of_containers = len(containers[container_name])
		for container_metadata in containers[container_name]:
			image_container_name = container_metadata.image_name
			host_format = '{0} {1} {2} {3} {4}\n'

			if number_of_containers == 1:
				host = host_format.format(container_metadata.ip, image_container_name + '.lab.figueiredo.com',
					image_container_name, container_metadata.name, container_metadata.short_id)
				containers_ips += host

				image_container_name += str(container_number)
				host = host_format.format(container_metadata.ip, image_container_name + '.lab.figueiredo.com',
				image_container_name, container_metadata.name, container_metadata.short_id)
				containers_ips += host
			else:
				image_container_name += str(container_number)
				host = host_format.format(container_metadata.ip, image_container_name + '.lab.figueiredo.com',
				image_container_name, container_metadata.name, container_metadata.short_id)
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

	logging.info('Starting container name=[' + container_name + '], ip=[' + ip + ']')

	# Regist container on consul
	try:
		consul.catalog.register(container_name, address=ip)
	except Exception as exception:
		logging.error(exception)
		#raise

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

			logging.info('Listing container name=[' + container_name + '], ip=[' + ip + ']')

			# Regist container on consul
			try:
				consul.catalog.register(container_name, address=ip)
			except Exception as exception:
				logging.error(exception)
				#raise

def clear_hosts():

	for node in consul.catalog.nodes()[1]:
		consul.catalog.deregister(node['Node'])

def update_containers_hosts(containers):
	for container_type in containers:
		for container_name in containers[container_type]:
			container = client.containers.get(container_name.id)
			hosts = print_containers(containers)
			command = 'echo "127.0.0.1 localhost\n\n### BEGIN DOCKER CONTAINER HOSTS\n' + hosts + '### END DOCKER CONTAINER HOSTS" > /etc/hosts'
			#print(command)
			logging.info('Updating container [' + container_name.name + '] /etc/hosts.')
			container.exec_run(['sh', '-c', command])

def main():

	import time
	time.sleep(20)
	
	logging.info('Main start...')

	containers = {}

	#clear_hosts()
	list_containers(containers)
	#write_hosts(containers)
	#update_containers_hosts(containers)

	for event in client.events():
		event_json = json.loads(event)

		if 'status' in event_json:
			if 'start' == event_json['status']:
				try:
					#logging.info('Starting registering container... [' + event_json['id'] + ']')
					add_new_container(containers, event)
					#write_hosts(containers)
					#update_containers_hosts(containers)
					#logging.info('End registering container... [' + event_json['id'] + ']')
				except Exception as exception:
					logging.error('Can''t add new container... [' + event + ']')
					raise

			if 'stop' == event_json['status']:
				try:
					remove_container(containers, event)
					#write_hosts(containers)
					#update_containers_hosts(containers)
				except Exception as exception:
					logging.error('Can''t remove container... [' + event + ']')
					raise

	logging.info('Main end...')


if __name__== "__main__":
  main()
