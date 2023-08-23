REPO := jorgeacf/docker-api-python

include ../../Makefile.main

.PHONY: run
run:
	docker run -it \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--privileged=true \
		$(REPO):$(VERSION)
