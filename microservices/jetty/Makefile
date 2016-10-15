REPO=jorgeacf/jetty
VERSION=$(shell cat VERSION)

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):$(VERSION) .

.PHONY: run
run:
	@docker run -itd \
		--name jetty \
		--hostname jetty \
		$(REPO):$(VERSION)