REPO=jorgeacf/zookeeper

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):lateast .

.PHONY: nocache
nocache:
	docker build -t $(REPO):lateast --no-cache .

.PHONY: run
run:
	docker run -ti --name zookeeper-single -p 2181:2181 $(REPO):lateast

.PHONY: run-multi
run-multi:
	docker run -d -i -t --name zookeeper-multi-1 -p 2181:2181 $(REPO):lateast
	docker run -d -i -t --name zookeeper-multi-2 -p 2182:2181 $(REPO):lateast
	docker run -d -i -t --name zookeeper-multi-3 -p 2183:2181 $(REPO):lateast