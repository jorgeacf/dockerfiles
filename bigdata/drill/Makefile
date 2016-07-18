REPO=jorgeacf/drill
VERSION=$(shell cat VERSION)

.PHONY: help
help:
	@echo ""
	@echo ""
	@echo "	Docker Apache Drill containers"
	@echo ""
	@echo "make build -> build Apache Drill docker images"
	@echo "make run -> run Apache Drill docker containers"
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