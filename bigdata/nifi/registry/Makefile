REPO=jorgeacf/nifi-registry

include ../../../Makefile.main

help:

	@echo ""
	@echo "This is the make help for Apache NiFi Registry (${VERSION}) docker image"
	@echo ""

.PHONY: run
run:
	@docker run -itd \
		-p 18080:18080 \
		-v ~/docker/volumes/nifi-registry/database/:/opt/nifi-registry/database \
		-v ~/docker/volumes/nifi-registry/logs/:/opt/nifi-registry/logs \
		$(REPO):$(VERSION) bash