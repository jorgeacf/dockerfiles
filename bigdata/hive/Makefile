REPO=jorgeacf/hive
VERSION=$(shell cat VERSION)

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Hive (${VERSION}) docker image"

	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	#mkdir -p hadoop/conf
	#cp -r ../hadoop/config/* hadoop/conf/
	@docker build -t $(REPO):$(VERSION) .
	#rm -r hadoop

.PHONY: run
run:
	@docker run -itd \
		--name hive \
		--hostname hive \
		$(REPO):$(VERSION)

	@echo 'Updating hostnames...'
	@../../scripts/docker-update-all-containers-hosts.sh

	#docker exec -it hive hive

.PHONY: clean
clean:

	@docker stop hive
	@docker rm hive