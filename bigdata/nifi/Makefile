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
		$(REPO):$(VERSION) bash