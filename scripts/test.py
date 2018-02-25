#!/usr/bin/env python

from threading import Thread

class DockerEventThread(Thread):

	def print_containers(self):
		print('print containers...')

	def run(self):
		print('run...')
		print_containers()


def main():

	print('Main start...')

	thread = DockerEventThread()
	thread.setName("Docker event thread")

	thread.start()
	thread.join()

	print('Main end...')

if __name__== "__main__":
	main()

