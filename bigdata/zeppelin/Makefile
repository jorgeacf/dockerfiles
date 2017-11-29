REPO=jorgeacf/zeppelin

include ../../Makefile.main

.DEFAULT_GOAL := help

help:

	@echo ""
	@echo "This is the make help for Apache Zeppelin (${VERSION}) docker image"

	@echo ""

.PHONY: run
run:
	docker run -tid --name zeppelin -p 8080:8080 $(REPO):$(VERSION)
