REPO=jorgeacf/maven
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
	docker push $(REPO):$(TAG)
	docker push $(REPO):latest

.PHONY: run
run:
	@docker run -it \
		--name maven-$(TAG) \
		$(REPO):$(TAG) bash

.PHONY: clean
clean:
	@docker stop maven-$(TAG)
	@docker rm maven-$(TAG)