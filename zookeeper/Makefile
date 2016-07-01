REPO=jorgeacf/zookeeper

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):latest .

.PHONY: nocache
nocache:
	docker build -t $(REPO):latest --no-cache .

.PHONY: run
run:
	docker run -ti --name zookeeper-single -p 2181:2181 $(REPO):latest

.PHONY: run-multi
run-multi:

	servers='zookeeper1,zookeeper2,zookeeper3'

	echo 'Starting Zookeeper #1...'
	docker run -itd --name zookeeper1 -h zookeeper1 -e SERVERS=$servers $(REPO):latest

	echo 'Starting Zookeeper #2...'
	docker run -itd --name zookeeper2 -h zookeeper2 -e SERVERS=$servers $(REPO):latest

	echo 'Starting Zookeeper #3...'
	docker run -itd --name zookeeper3 -h zookeeper3 -e SERVERS=$servers $(REPO):latest

	echo 'Updating hostnames on containers...'
	../scripts/docker-update-all-containers-hosts.sh