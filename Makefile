 ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

VERSION:=$(shell [ -r VERSION ] && cat VERSION || echo latest)
NAMESPACE:=jorgeacf
REPO:=$(shell basename "$$PWD")

# Ignore arguments first word
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
CURRENT_USER_NAME := $(shell whoami)
#CURRENT_USER_ID := $(id -u ${CURRENT_USER_NAME})
#CURRENT_USER_GROUP_ID := $(id -g ${CURRENT_USER_NAME})

OS_NAME := $(shell uname -s | tr A-Z a-z)

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
	@echo "OS: ${OS_NAME}"
	@echo "Docker Image: $(NAMESPACE)/$(REPO):$(VERSION)"
	# check Dockerfile with lint

.PHONY: all
all:
	@$(MAKE) build

.PHONY: lint
lint:
	@dockerlint Dockerfile

	# brew install hadolint
	# hadolint Dockerfile

	# brew install shellcheck
	# shellcheck entrypoint.sh

.PHONY: build
build:
	#@$(MAKE) lint
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
	@docker run -it \
		-p 80:80 \
		-v $(HOME)/dev:/home/$(whoami)/dev \
		-v $(HOME)/.ssh:/home/$(whoami)/.ssh \
		-v $(HOME)/.now:/home/$(whoami)/.now \
		-v $(HOME)/.ssl:/home/$(whoami)/.ssl \
		-v $(HOME)/html:/var/www/html \
		$(NAMESPACE)/$(REPO):$(VERSION) ${RUN_ARGS}

		#-w /home/$(whoami) \
		#-u $(id -u ${USER}):$(id -g ${USER}) \

.PHONY: run-d
run-d:
	@docker run -itd \
		-p 80:80 \
		-v $(HOME)/dev:/home/$(whoami)/dev \
		-v $(HOME)/.ssh:/home/$(whoami)/.ssh \
		-v $(HOME)/.now:/home/$(whoami)/.now \
		-v $(HOME)/.ssl:/home/$(whoami)/.ssl \
		-v $(HOME)/html:/var/www/html \
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