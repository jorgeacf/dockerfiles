REPO=jorgeacf/kafka
VERSION=$(shell cat VERSION)

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Kafka (${VERSION}) docker image"

	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	#@make clear
	docker build -t $(REPO):$(VERSION) .

.PHONY: nocache
nocache:
	docker build -t $(REPO):$(VERSION) --no-cache .

.PHONY: run
run:
	docker run -ti -p 2181:2181 -p 9092:9092 $(REPO):$(VERSION)

.PHONY: run-multi
run-multi:

	echo 'Starting Zookeeper #1...'
	@docker run -itd --name zookeeper1 -h zookeeper1 -e ZOO_SERVERS='zookeeper1,zookeeper2,zookeeper3' jorgeacf/zookeeper:3.4.10

	echo 'Starting Zookeeper #2...'
	@docker run -itd --name zookeeper2 -h zookeeper2 -e ZOO_SERVERS='zookeeper1,zookeeper2,zookeeper3' jorgeacf/zookeeper:3.4.10

	echo 'Starting Zookeeper #3...'
	@docker run -itd --name zookeeper3 -h zookeeper3 -e ZOO_SERVERS='zookeeper1,zookeeper2,zookeeper3' jorgeacf/zookeeper:3.4.10

	@echo 'Updating hostnames...'
	@../../scripts/docker-update-all-containers-hosts.sh

#	sleep 20;

	echo 'Starting Kafka #1...'
	docker run -itd --name kafka1 -h kafka1 -e SERVERS='kafka1,kafka2,kafka3' $(REPO):$(VERSION)

	echo 'Starting Kafka #2...'
	docker run -itd --name kafka2 -h kafka2 -e SERVERS='kafka1,kafka2,kafka3' $(REPO):$(VERSION)

	echo 'Starting Kafka #3...'
	docker run -itd --name kafka3 -h kafka3 -e SERVERS='kafka1,kafka2,kafka3' $(REPO):$(VERSION)

	@echo 'Updating hostnames on containers...'
	@../../scripts/docker-update-all-containers-hosts.sh

.PHONY: clean
clean:

	-@docker ps | grep $(REPO):$(VERSION) | awk '{ print $$1 }' | xargs docker kill > /dev/null
	-@docker ps -a | grep $(REPO):$(VERSION) | awk '{ print $$1 }' | xargs docker rm > /dev/null
	@echo "Apache Kafka containers cleaned..."

	@docker stop zookeeper1 >/dev/null
	@docker stop zookeeper2 >/dev/null
	@docker stop zookeeper3 >/dev/null
	@docker rm zookeeper1 >/dev/null
	@docker rm zookeeper2 >/dev/null
	@docker rm zookeeper3 >/dev/null

	@echo "Apache Zookeeper containers cleaned..."