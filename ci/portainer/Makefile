REPO=jorgeacf/portainer

include ../../Makefile.main

help:

	@echo ""
	@echo "This is the make help for Portainer (${VERSION}) docker image"

	@echo ""

.PHONY: run
run:
	@docker run -d --privileged -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data $(REPO):$(VERSION)