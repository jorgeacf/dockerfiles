REPO=jorgeacf/nexus

include ../../Makefile.main

.PHONY: run
run:
	@docker run -itd \
		--name nexus \
		--hostname nexus \
		$(REPO):$(VERSION)