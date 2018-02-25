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

def main():

	print('Main docker-hosts start...')

	print('Main docker-hosts end...')

if __name__== "__main__":
	main()
