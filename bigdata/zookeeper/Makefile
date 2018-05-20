REPO=jorgeacf/zookeeper

include ../../Makefile.main

help:

	@echo ""
	@echo "This is the make help for Apache Zookeeper (${VERSION}) docker image"

	@echo ""

.PHONY: run
run:

	@echo 'Starting Zookeeper #1...'
	@docker run -itd \
		-v ~/docker_volumes/zookeeper:/data \
		$(REPO):$(VERSION)

.PHONY: run-multi
run-multi:

	@echo 'Starting Zookeeper #1...'
	@docker run -itd $(REPO):$(VERSION) 1

	@echo 'Starting Zookeeper #2...'
	@docker run -itd $(REPO):$(VERSION) 2

	@echo 'Starting Zookeeper #3...'
	@docker run -itd $(REPO):$(VERSION) 3

	#@echo 'Updating hostnames...'
	#@../../scripts/docker-update-all-containers-hosts.sh
