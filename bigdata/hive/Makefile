REPO=jorgeacf/hive
VERSION=$(shell cat VERSION)

.PHONY: all
all:
	make build

.PHONY: build
build:
	#mkdir -p hadoop/conf
	#cp -r ../hadoop/config/* hadoop/conf/
	docker build -t $(REPO):$(VERSION) .
	#rm -r hadoop

.PHONY: run
run:
	docker run -itd \
		--name hive \
		--hostname hive \
		$(REPO):$(VERSION)

	echo 'Updating hostnames...'
	../../scripts/docker-update-all-containers-hosts.sh