REPO=jorgeacf/sbt
VERSION=$(shell cat VERSION)
TAG=$(shell perl -n -e '/^\s*ARG\s+.+_VERSION\s*=\s*(\d+\.\d+.\d+)/ && &{ print $$1; exit }' Dockerfile)

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):$(TAG) .

.PHONY: push
push:
	docker push hub.docker.com/$(REPO):$(TAG)

.PHONY: run
run:
	@docker run -it \
		$(REPO):$(VERSION) bash

.PHONY: clean
clean:
	@docker stop sbt
	@docker rm sbt