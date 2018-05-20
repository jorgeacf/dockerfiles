REPO := jorgeacf/docker-discovery

include ../../Makefile.main

.PHONY: run
run:
	docker run -it \
		--name docker-container-discovery \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--privileged=true \
		--restart unless-stopped \
		$(REPO):$(VERSION)

.PHONY: run-d
run-d:
	docker run -itd \
		--name docker-container-discovery \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--privileged=true \
		--restart unless-stopped \
		$(REPO):$(VERSION)
