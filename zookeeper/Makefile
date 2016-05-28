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
	docker run -ti -p 2181:2181 $(REPO):lateast