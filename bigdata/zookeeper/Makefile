REPO=jorgeacf/zookeeper

include ../../Makefile.main

help:

	@echo ""
	@echo "This is the make help for Apache Zookeeper (${VERSION}) docker image"

	@echo ""

.PHONY: run-multi
run-multi:

	@echo 'Starting Zookeeper #1...'
	@docker run -itd --name zookeeper1 $(REPO):$(VERSION)

	@echo 'Starting Zookeeper #2...'
	@docker run -itd --name zookeeper2 $(REPO):$(VERSION) 2

	@echo 'Starting Zookeeper #3...'
	@docker run -itd --name zookeeper3 $(REPO):$(VERSION) 3

	#@echo 'Updating hostnames...'
	#@../../scripts/docker-update-all-containers-hosts.sh
