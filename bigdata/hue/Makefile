REPO=jorgeacf/hue

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Hue (${VERSION}) docker image"

	@echo ""

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):latest .

.PHONY: run
run:
	@docker run -it \
		--name hue \
		--hostname hue \
		$(REPO):latest

	@echo 'Updating hostnames...'
	@../../scripts/docker-update-all-containers-hosts.sh

.PHONY: clear
clear:
	@docker stop hue
	@docker rm hue