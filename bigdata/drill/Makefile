REPO=jorgeacf/drill
VERSION=$(shell cat VERSION)

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Drill (${VERSION}) docker image"

	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	@sed -i -e "s/ARG APACHE_DRILL_VERSION=.*/ARG APACHE_DRILL_VERSION=$(VERSION)/g" Dockerfile
	@docker build -t $(REPO):$(VERSION) .

.PHONY: run
run:
	@docker run -ti --name drill --hostname drill $(REPO):$(VERSION)

.PHONY: clean
clean:
	@docker stop drill >/dev/null
	@docker rm drill >/dev/null

	@echo "Drill containers cleaned..."