
REPO=jorgeacf/cassandra

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):latest .

.PHONY: run-multi
run-multi:
	
	for i in {1..$(nodes)}; do \
		echo "Starting Cassandra Node #$$i container..."; \
		docker run -itd --name cassandra$$i --hostname cassandra$$i $(REPO):latest /entrypoint.sh $(nodes); \
	done

	echo 'Updating hostnames...'
	../scripts/docker-update-all-containers-hosts.sh

.PHONY: clear
clear:

	docker stop cassandra1
	docker rm cassandra1

	docker stop cassandra2
	docker rm cassandra2

	docker stop cassandra3
	docker rm cassandra3