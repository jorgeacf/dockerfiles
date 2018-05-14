REPO := jorgeacf/consulate

include ../../Makefile.main

.PHONY: run
run:
	@docker run -it \
		--dns 172.17.0.2 \
		--dns 8.8.8.8 \
		--dns-search service.consul \
		$(REPO):$(VERSION) bash
