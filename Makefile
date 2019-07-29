ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

VERSION:=$(shell [ -r VERSION ] && cat VERSION || echo latest)
NAMESPACE:=jorgeacf
REPO:=$(shell basename "$$PWD")

# Ignore arguments first word
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
CURRENT_USER_NAME := $(shell whoami)
#CURRENT_USER_ID := $(id -u ${CURRENT_USER_NAME})
#CURRENT_USER_GROUP_ID := $(id -g ${CURRENT_USER_NAME})

SHELL += -eu

BLUE  := \033[0;34m
GREEN := \033[0;32m
RED   := \033[0;31m
NC    := \033[0m

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
	#@sed -i -e "s/ARG NODEJS_VERSION=.*/ARG NODEJS_VERSION=$(VERSION)/g" Dockerfile
	@echo -e "${BLUE}Building...${NC}" $<
	@docker build -t $(NAMESPACE)/$(REPO):$(VERSION) --build-arg VERSION=$(VERSION) . ; \
	if [ $$? -ne 0 ] ; \
		then echo -e "\n${RED}  Build failed :(${NC}\n" ; \
	else echo -e "\n${GREEN} ✓ Successfully built [$(NAMESPACE)/$(REPO):$(VERSION)] docker image. ${NC}\n" ; fi

.PHONY: push
push:
	#@docker login --username=jorgeacf
	@docker tag $(NAMESPACE)/$(REPO):$(VERSION) $(NAMESPACE)/$(REPO):$(VERSION)
	@docker tag $(NAMESPACE)/$(REPO):$(VERSION) $(NAMESPACE)/$(REPO):latest
	@docker push $(NAMESPACE)/$(REPO):$(VERSION)
	@docker push $(NAMESPACE)/$(REPO):latest

.PHONY: run
run:
	docker run -it \
		-v $(HOME)/dev:/home/$(CURRENT_USER_NAME)/dev \
		-v $(HOME)/.ssh:/home/$(CURRENT_USER_NAME)/.ssh \
		-v $(HOME)/.now:/home/$(CURRENT_USER_NAME)/.now \
		-v $(HOME)/.ssl:/home/$(CURRENT_USER_NAME)/.ssl \
		-v $(HOME)/.npm:/home/$(CURRENT_USER_NAME)/.npm \
		-w /home/$(CURRENT_USER_NAME) \
		-u 1000:1000 \
		-v /etc/passwd:/etc/passwd \
		$(NAMESPACE)/$(REPO):$(VERSION) ${RUN_ARGS}

.PHONY: run-d
run-d:
	@docker run -itd \
		-v $(HOME)/dev:/home/$(CURRENT_USER_NAME)/dev \
		-v $(HOME)/.ssh:/home/$(CURRENT_USER_NAME)/.ssh \
		-v $(HOME)/.now:/home/$(CURRENT_USER_NAME)/.now \
		-v $(HOME)/.ssl:/home/$(CURRENT_USER_NAME)/.ssl \
		-v $(HOME)/.npm:/home/$(CURRENT_USER_NAME)/.npm \
		-w /home/$(CURRENT_USER_NAME) \
		-u 1000:1000 \
		-u $(id -u ${USER}):$(id -g ${USER}) \
		$(NAMESPACE)/$(REPO):$(VERSION) ${RUN_ARGS}

.PHONY: clean
clean:
	@docker stop $$(docker ps -a -q --filter ancestor=$(NAMESPACE)/$(REPO):$(VERSION) --format="{{.ID}}") >> /dev/null
	@docker rm $$(docker ps -a -q --filter ancestor=$(NAMESPACE)/$(REPO):$(VERSION) --format="{{.ID}}")

.PHONY: rerun
rerun:
	@$(MAKE) clean
	@$(MAKE) build
	@$(MAKE) run

.PHONY: rerun-d
rerun-d:
	@$(MAKE) clean
	@$(MAKE) build
	@$(MAKE) run-d

#
#	All docker image targets
#

.PHONY: build-all
build-all:
	for x in os/*; do [ -d $$x ] || continue; pushd $$x; make build; popd; done

	#for x in bigdata/*; do [ -d $$x ] || continue; pushd $$x; make build; popd; done

	#for x in ci/*; do [ -d $$x ] || continue; pushd $$x; make build; popd; done