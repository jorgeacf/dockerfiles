REPO=jorgeacf/hadoop
VERSION=$(shell cat VERSION)

.DEFAULT_GOAL := help

.PHONY: help
help:

	@echo ""
	@echo "This is the make help for Apache Hadoop (${VERSION}) docker image"
	@echo ""
	@echo "  Run 'make build' to build the Hadoop docker image."
	@echo "  Run 'make run-multi slaves=n' to start Hadoop with n slaves."
	@echo "  Run 'make clean' to clean all Hadoop containers."
	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	@sed -i -e "s/ARG HADOOP_VERSION=.*/ARG HADOOP_VERSION=$(VERSION)/g" Dockerfile
	@docker build -t $(REPO):$(VERSION) .

.PHONY: nocache
nocache:
	@sed -i -e "s/ARG HADOOP_VERSION=.*/ARG HADOOP_VERSION=$(VERSION)/g" Dockerfile
	docker build -t $(REPO):$(VERSION) --no-cache .

.PHONY: push
push:
	docker tag $(REPO):$(VERSION) $(REPO):latest
	docker push $(REPO):latest
	docker push $(REPO):$(VERSION)

.PHONY: run
run:
	docker run -ti $(REPO):$(VERSION)

.PHONY: download
download:
	@scripts/download-dependencies.sh ${VERSION}

.PHONY: run-multi
run-multi:

	@echo "Starting hadoop-master container..."
	@docker run -itd \
		--name resourcemanager \
		--hostname resourcemanager \
		$(REPO):$(VERSION) "/entrypoint-resource-manager.sh"

	@docker run -itd \
		--name node1 \
		--hostname node1 \
		$(REPO):$(VERSION) "/entrypoint-node-manager.sh"


	@echo 'Updating hostnames...'
	@../../scripts/docker-update-all-containers-hosts.sh

.PHONY: clean
clean:

	-@docker ps | grep $(REPO):$(VERSION) | awk '{ print $$1 }' | xargs docker kill > /dev/null
	-@docker ps -a | grep $(REPO):$(VERSION) | awk '{ print $$1 }' | xargs docker rm > /dev/null

	@echo "Apache Hadoop containers cleaned..."