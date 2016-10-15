REPO=jorgeacf/jenkins
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
		--name jenkins \
		--hostname jenkins \
		-v ~/jenkins_home:/var/jenkins_home \
		--user 0 \
		$(REPO):$(VERSION)

	echo 'Updating hostnames...'
	@../../scripts/docker-update-all-containers-hosts.sh

.PHONY: clean
clean:
	@docker stop jenkins
	@docker rm jenkins