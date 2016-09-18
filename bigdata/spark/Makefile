REPO=jorgeacf/spark
VERSION=$(shell cat VERSION)

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Spark (${VERSION}) docker image"

	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	mkdir -p hadoop/conf
	cp -r ../hadoop/config/* hadoop/conf/
	docker build -t $(REPO):$(VERSION) .
	rm -r hadoop

.PHONY: nocache
nocache:
	docker build -t $(REPO):$(VERSION) --no-cache .

.PHONY: run-yarn
run-yarn:

	@docker run -itd --name spark --hostname spark -p 4040:4040 -p 7077:7077 -p 8080:8080 -p 8081:8081 $(REPO):$(VERSION)

	@echo 'Updating hostnames...'
	@../../scripts/docker-update-all-containers-hosts.sh

	@docker exec -it spark bash

.PHONY: clean
clean:

	@docker stop spark
	@docker rm spark