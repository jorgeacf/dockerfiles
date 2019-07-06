ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

VERSION:=$(shell [ -r VERSION ] && cat VERSION || echo latest)
NAMESPACE:=jorgeacf
REPO:=$(shell basename "$$PWD")

# Ignore arguments first word
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))


#
#	Single docker image targets
#

.DEFAULT_GOAL := help

.PHONY: version
version:
	@echo $(NAMESPACE)/$(REPO):$(VERSION)

.PHONY: all
all:
	make build

.PHONY: build
build:
	@docker build -t $(NAMESPACE)/$(REPO):$(VERSION) --build-arg VERSION=$(VERSION) .

.PHONY: push
push:
	@docker tag $(NAMESPACE)/$(REPO):$(VERSION) $(NAMESPACE)/$(REPO):latest
	@docker push $(NAMESPACE)/$(REPO):latest
	@docker push $(NAMESPACE)/$(REPO):$(VERSION)

.PHONY: run
run:
	@docker run -it \
		-v $(HOME)/dev:/home/$(whoami)/dev \
		-v $(HOME)/.ssh:/home/$(whoami)/.ssh \
		-v $(HOME)/.now:/home/$(whoami)/.now \
		-w /home/$(whoami) \
		-u $(id -u ${USER}):$(id -g ${USER}) \
		$(NAMESPACE)/$(REPO):$(VERSION) ${RUN_ARGS}

.PHONY: run-d
run-d:
	@docker run -itd \
		-v $(HOME)/dev:/home/$(whoami)/dev \
		-v $(HOME)/.ssh:/home/$(whoami)/.ssh \
		-v $(HOME)/.now:/home/$(whoami)/.now \
		-w /home/$(whoami) \
		-u $(id -u ${USER}):$(id -g ${USER}) \
		$(NAMESPACE)/$(REPO):$(VERSION) ${RUN_ARGS}

.PHONY: clean
clean:
	@docker stop $$(docker ps -a -q --filter ancestor=$(NAMESPACE)/$(REPO):$(VERSION) --format="{{.ID}}") >> /dev/null
	@docker rm $$(docker ps -a -q --filter ancestor=$(NAMESPACE)/$(REPO):$(VERSION) --format="{{.ID}}")



#
#	All docker image targets
#

.PHONY: build-all
build-all:
	for x in os/*; do [ -d $$x ] || continue; pushd $$x; make build; popd; done

	#for x in bigdata/*; do [ -d $$x ] || continue; pushd $$x; make build; popd; done

	#for x in ci/*; do [ -d $$x ] || continue; pushd $$x; make build; popd; done