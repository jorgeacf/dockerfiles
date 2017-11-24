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
	docker run -itd --name zookeeper-single -p 2181:2181 $(REPO):$(VERSION) 1

.PHONY: run-multi
run-multi:

	@echo 'Starting Zookeeper #1...'
	@docker run -itd --name zookeeper1 $(REPO):$(VERSION) 1

	@echo 'Starting Zookeeper #2...'
	@docker run -itd --name zookeeper2 $(REPO):$(VERSION) 2 172.17.0.2

	@echo 'Starting Zookeeper #3...'
	@docker run -itd --name zookeeper3 $(REPO):$(VERSION) 3 172.17.0.2

	#@echo 'Updating hostnames...'
	#@../../scripts/docker-update-all-containers-hosts.sh

.PHONY: clean
clean:
	@docker stop zookeeper1 >/dev/null
	@docker stop zookeeper2 >/dev/null
	@docker stop zookeeper3 >/dev/null
	@docker rm zookeeper1 >/dev/null
	@docker rm zookeeper2 >/dev/null
	@docker rm zookeeper3 >/dev/null

	@echo "Apache Zookeeper containers cleaned..."