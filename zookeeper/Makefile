REPO=jorgeacf/zookeeper

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):latest .

.PHONY: nocache
nocache:
	docker build -t $(REPO):latest --no-cache .

.PHONY: run
run:
	docker run -ti --name zookeeper-single -p 2181:2181 $(REPO):latest

.PHONY: run-multi
run-multi:
	docker-compose up