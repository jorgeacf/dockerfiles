REPO=jorgeacf/zookeeper
VERSION=$(shell cat VERSION)

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Zookeeper (${VERSION}) docker image"

	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):$(VERSION) .

.PHONY: nocache
nocache:
	docker build -t $(REPO):$(VERSION) --no-cache .

.PHONY: run
run:
	docker run -ti --name zookeeper-single -p 2181:2181 $(REPO):$(VERSION)

.PHONY: run-multi
run-multi:

	echo 'Starting Zookeeper #1...'
	@docker run -itd --name zookeeper1 -h zookeeper1 -e SERVERS='zookeeper1,zookeeper2,zookeeper3' $(REPO):$(VERSION)

	echo 'Starting Zookeeper #2...'
	@docker run -itd --name zookeeper2 -h zookeeper2 -e SERVERS='zookeeper1,zookeeper2,zookeeper3' $(REPO):$(VERSION)

	echo 'Starting Zookeeper #3...'
	@docker run -itd --name zookeeper3 -h zookeeper3 -e SERVERS='zookeeper1,zookeeper2,zookeeper3' $(REPO):$(VERSION)

	echo 'Updating hostnames on containers...'
	@../../scripts/docker-update-all-containers-hosts.sh

.PHONY: clean
clean:
	@docker stop zookeeper1 >/dev/null
	@docker stop zookeeper2 >/dev/null
	@docker stop zookeeper3 >/dev/null
	@docker rm zookeeper1 >/dev/null
	@docker rm zookeeper2 >/dev/null
	@docker rm zookeeper3 >/dev/null

	@echo "Apache Zookeeper containers cleaned..."