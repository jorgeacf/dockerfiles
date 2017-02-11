REPO=jorgeacf/zeppelin
VERSION=$(shell cat VERSION)

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Zeppelin (${VERSION}) docker image"

	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):$(VERSION) .

.PHONY: run
run:
	docker run -tid --name zeppelin $(REPO):$(VERSION)

.PHONY: clean
clean:
	@docker stop zeppelin >/dev/null
	@docker rm zeppelin >/dev/null

	@echo "Apache Zeppelin containers cleaned..."