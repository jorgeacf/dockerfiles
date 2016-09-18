
REPO=jorgeacf/mesos

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Mesos (${VERSION}) docker image"

	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):latest .

.PHONY: run-multi
run-multi:

	docker run -itd \
		--name mesos-master \
		--hostname mesos-master \
		$(REPO):latest /entrypoint-master.sh

	for i in {1..$(slaves)}; do \
		echo "Starting mesos-slave$$i container..."; \
		docker run -itd --name mesos-slave$$i --hostname mesos-slave$$i --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro $(REPO):latest /entrypoint-slave.sh; \
	done

	echo 'Updating hostnames...'
	@../../scripts/docker-update-all-containers-hosts.sh

.PHONY: clean
clean:

	-@docker ps | grep $(REPO):$(VERSION) | awk '{ print $$1 }' | xargs docker kill > /dev/null
	-@docker ps -a | grep $(REPO):$(VERSION) | awk '{ print $$1 }' | xargs docker rm > /dev/null

	@echo "Apache Mesos containers cleaned..."