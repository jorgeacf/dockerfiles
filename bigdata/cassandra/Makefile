REPO=jorgeacf/cassandra
VERSION=$(shell cat VERSION)

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Cassandra (${VERSION}) docker image"

	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	@docker build -t $(REPO):$(VERSION) .

.PHONY: run-multi
run-multi:
	
	@for i in {1..$(nodes)}; do \
		echo "Starting Cassandra Node #$$i container..."; \
		docker run -itd --name cassandra$$i --hostname cassandra$$i $(REPO):$(VERSION) /entrypoint.sh $(nodes); \
	done

	@echo 'Updating hostnames...'
	@../../scripts/docker-update-all-containers-hosts.sh

.PHONY: clean
clean:

	-@docker ps | grep $(REPO):$(VERSION) | awk '{ print $$1 }' | xargs docker kill > /dev/null
	-@docker ps -a | grep $(REPO):$(VERSION) | awk '{ print $$1 }' | xargs docker rm > /dev/null

	@echo "Apache Cassandra containers cleaned..."