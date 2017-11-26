REPO=jorgeacf/docker-discovery
TAG=latest

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):$(TAG) .

.PHONY: push
push:
	docker push $(REPO):$(TAG)
	docker push $(REPO):latest

.PHONY: run
run:
	@docker run -it \
		--hostname docker-discovery \
		--name docker-discovery \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--privileged=true \
		--restart always \
		$(REPO):$(TAG) bash

		# curl --unix-socket /run/docker.sock http://docker/images/json

.PHONY: clean
clean:
	@docker stop docker-discovery
	@docker rm docker-discovery