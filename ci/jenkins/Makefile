REPO=jorgeacf/jenkins

include ../../Makefile.main

.PHONY: run
run:
	@docker run -itd \
		--name jenkins \
		--hostname jenkins \
		-v ~/jenkins_home:/var/jenkins_home \
		--user 0 \
		$(REPO):$(VERSION)