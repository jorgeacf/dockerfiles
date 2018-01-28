REPO=jorgeacf/cassandra

include ../../Makefile.main

help:

	@echo ""
	@echo "This is the make help for Apache Cassandra (${VERSION}) docker image"

	@echo ""


.PHONY: run-multi
run-multi:
	
	@for i in {1..$(nodes)}; do \
		echo "Starting Cassandra Node #$$i container..."; \
		docker run -itd --name cassandra$$i --hostname cassandra$$i $(REPO):$(VERSION) /entrypoint.sh $(nodes); \
	done

	@echo 'Updating hostnames...'
	@../../scripts/docker-update-all-containers-hosts.sh
