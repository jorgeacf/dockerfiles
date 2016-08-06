REPO=jorgeacf/hadoop
VERSION=$(shell cat VERSION)

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
	docker run -ti $(REPO):$(VERSION)

.PHONY: run-multi
run-multi:

	echo "Starting hadoop-master container..."
	docker run -itd \
		--name hadoop-master \
		--hostname hadoop-master \
		-e SLAVES=$(slaves) \
		$(REPO):$(VERSION) 

	for i in {1..$(slaves)}; do \
		echo "Starting hadoop-slave$$i container..."; \
		docker run -itd --name hadoop-slave$$i --hostname hadoop-slave$$i $(REPO):$(VERSION); \
	done

	echo 'Updating hostnames...'
	../../scripts/docker-update-all-containers-hosts.sh

.PHONY: clean
clean:
	@docker stop hadoop-master >/dev/null
	@docker rm hadoop-master >/dev/null

	@echo "Apache Hadoop containers cleaned..."