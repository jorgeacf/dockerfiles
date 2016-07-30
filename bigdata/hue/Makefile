REPO=jorgeacf/hue

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):latest .

.PHONY: run
run:
	docker run -ti \
		--name hue \
		--hostname hue \
		$(REPO):latest

.PHONY: clear
clear:
	docker stop hue
	docker rm hue