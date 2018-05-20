REPO := jorgeacf/consul-server

include ../../Makefile.main

.PHONY: run
run:
	docker run -it \
		--name consul-server \
		--restart unless-stopped \
		$(REPO):$(VERSION)

.PHONY: run-d
run-d:
	docker run -itd \
		--name consul-server \
		--restart unless-stopped \
		$(REPO):$(VERSION)