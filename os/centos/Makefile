REPO=jorgeacf/centos

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO) .

.PHONY: run
run:
		@docker run -it $(REPO):latest bash