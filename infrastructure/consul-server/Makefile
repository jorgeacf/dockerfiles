REPO := jorgeacf/consul-server

include ../../Makefile.main

.PHONY: run-d
run-d:
	docker run -itd \
		--name consul-server \
		$(REPO):$(VERSION)