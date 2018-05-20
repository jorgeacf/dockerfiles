REPO=jorgeacf/hadoop

include ../../Makefile.main

help:
	@echo ""
	@echo "This is the make help for Apache Hadoop (${VERSION}) docker image"
	@echo ""
	@echo "  Run 'make build' to build the Hadoop docker image."
	@echo "  Run 'make run-multi slaves=n' to start Hadoop with n slaves."
	@echo "  Run 'make clean' to clean all Hadoop containers."
	@echo ""

	make version

#.PHONY: build
#build:
#	@sed -i -e "s/ARG HADOOP_VERSION=.*/ARG HADOOP_VERSION=$(VERSION)/g" Dockerfile
#	@docker build -t $(REPO):$(VERSION) .

.PHONY: download
download:
	@scripts/download-dependencies.sh ${VERSION}

.PHONY: run-multi
run-multi:

	RESOURCE_MANAGER_NAME=yarn-master
	NODE_MANAGER_NAME=yarn-slave

	@echo "Starting $(RESOURCE_MANAGER_NAME) container..."
	@docker run -itd \
		$(REPO):$(VERSION) "/entrypoint-resource-manager.sh"

	@echo "Starting ${NODE_MANAGER_NAME}1 container..."
	@docker run -itd \
		$(REPO):$(VERSION) "/entrypoint-node-manager.sh"


	#@echo 'Updating hostnames...'
	#$(ROOT_DIR)/scripts/docker-update-all-containers-hosts.sh
