
REPO=jorgeacf/mesos

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
		docker run -it --name mesos-slave$$i --hostname mesos-slave$$i --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro $(REPO):latest /entrypoint-slave.sh; \
	done

	echo 'Updating hostnames...'
	../scripts/docker-update-all-containers-hosts.sh

.PHONY: clean
clean:

	#docker stop mesos-master
	docker rm -f mesos-master

	for i in {1..$(slaves)}; do \
		echo "Removing mesos-slave$$i container..."; \
		docker rm -f mesos-slave$$i; \
	done