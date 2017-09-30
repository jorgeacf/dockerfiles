REPO=jorgeacf/sbt
VERSION=$(shell cat VERSION)

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):$(VERSION) .

.PHONY: run
run:
	@docker run -it \
		$(REPO):$(VERSION) bash

.PHONY: clean
clean:
	@docker stop sbt
	@docker rm sbt