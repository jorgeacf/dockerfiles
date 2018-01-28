REPO=jorgeacf/nifi

include ../../Makefile.main

help:

	@echo ""
	@echo "This is the make help for Apache NiFi (${VERSION}) docker image"
	@echo ""

.PHONY: run
run:
	@docker run -itd \
		-p 8080:8080 \
		-v ~/docker/volumes/nifi/data/:/opt/nifi/data \
		-v ~/docker/volumes/nifi/logs/:/opt/nifi/logs \
		$(REPO):$(VERSION) bash