ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

VERSION:=$(shell [ -r VERSION ] && cat VERSION || echo latest)
NAMESPACE:=jorgeacf
REPO:=$(shell basename "$$PWD")

# Ignore arguments first word
CMD_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
CURRENT_USER_NAME := $(shell whoami)
#CURRENT_USER_ID := $(id -u ${CURRENT_USER_NAME})
#CURRENT_USER_GROUP_ID := $(id -g ${CURRENT_USER_NAME})

OS_NAME := $(shell uname -s | tr A-Z a-z)

SHELL += -eu

BLUE  := \033[0;34m
GREEN := \033[0;32m
RED   := \033[0;31m
NC    := \033[0m

DOCKER_RUN_PARAMETERS=-p 80:80 -p 8080:8080 -p 8081:8081 -v $(HOME):/root

.SILENT:

#
#	Single docker image targets
#

.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo ''
	@echo "OS: ${OS_NAME}"
	@echo "${GREEN}Docker Image: $(NAMESPACE)/$(REPO):$(VERSION)${NC}"
	@echo ''
	@echo 'Usage: make ${BLUE}[TARGET]${NC} ${RED}[EXTRA_ARGUMENTS]${NC}'
	@echo 'Target:'
	@echo '   ${BLUE}lint${NC} runs Dockerfile and entrypoint.sh lint tools.'
	@echo '   ${BLUE}build${NC} this docker image locally.'
	@echo '   ${BLUE}push${NC} this docker image to a remote repository.'
	@echo '   ${BLUE}run${NC} a container of this docker image.'
	@echo '   ${BLUE}run-d${NC} a container in the backgroud of this docker image.'
	@echo '   ${BLUE}clean${NC} all containers of this docker image.'
	@echo ''
	@echo 'Extra arguments:'
	@echo '${RED}cmd=${NC}:	make cmd="whoami"'

.PHONY: version
version:
	@echo ''
	@echo "OS: \t\t${OS_NAME}"
	@echo "Docker Image: \t$(NAMESPACE)/$(REPO):$(VERSION)"
	@echo "Current User: \t${CURRENT_USER_NAME}"
	@echo "CMD Args: \t\t${CMD_ARGS}"
	@echo ''
	# check Dockerfile with lint

.PHONY: all
all:
	@$(MAKE) build

.PHONY: install-build-dependencies
install-build-dependencies:

ifeq ($(OS_NAME),darwin)
	 brew install hadolint
	 brew install shellcheck
endif

ifeq ($(OS_NAME),linux)
	echo "On Linux"
endif

.PHONY: lint
lint:
	#@dockerlint Dockerfile

	# brew install hadolint
	#hadolint Dockerfile

	# brew install shellcheck
	#shellcheck entrypoint.sh

.PHONY: build
build:
	@$(MAKE) version
	@$(MAKE) lint
	#@sed -i -e "s/ARG NODEJS_VERSION=.*/ARG NODEJS_VERSION=$(VERSION)/g" Dockerfile
	#@echo "${BLUE}Starting to build docker image...${NC}" $<
	@docker build -t $(NAMESPACE)/$(REPO):$(VERSION) --build-arg VERSION=$(VERSION) . ; \
	if [ $$? -ne 0 ] ; \
		then echo "\n${RED}  Build failed :(${NC}\n" ; \
	else echo "\n${GREEN} ✓ Successfully build [$(NAMESPACE)/$(REPO):$(VERSION)] docker image. ${NC}\n" ; fi

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
		$(DOCKER_RUN_PARAMETERS) \
		$(NAMESPACE)/$(REPO):$(VERSION) ${CMD_ARGS}

.PHONY: run-d
run-d:
	@docker run -itd \
		$(DOCKER_RUN_PARAMETERS) \
		$(NAMESPACE)/$(REPO):$(VERSION) ${CMD_ARGS}

.PHONY: exec
exec:
	if [ -z "${CMD_ARGS}" ] ; \
		then docker exec -it $$(docker ps -a -q --filter ancestor=$(NAMESPACE)/$(REPO):$(VERSION) --filter status=running --format="{{.ID}}") /bin/bash; \
	else docker exec -it $$(docker ps -a -q --filter ancestor=$(NAMESPACE)/$(REPO):$(VERSION) --filter status=running --format="{{.ID}}") entrypoint.sh ${CMD_ARGS}; fi

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