REPO=jorgeacf/nodejs
VERSION=$(shell cat VERSION)

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Node.js (${VERSION}) docker image"
	@echo ""
	@echo "  Run 'make build' to build the Node.js docker image."
	@echo ""

.PHONY: build
build:
	@sed -i -e "s/ARG NODEJS_VERSION=.*/ARG NODEJS_VERSION=$(VERSION)/g" Dockerfile
	@docker build -t $(REPO):$(VERSION) .

.PHONY: run
run:
	docker run -tid $(REPO):$(VERSION)