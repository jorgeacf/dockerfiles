REPO := jorgeacf/jekyll

include ../../Makefile.main

.PHONY: run
run:
	docker run -it \
		--volume /home/jorgeacf/dev/github/jorgeacf.github.io:/site \
		$(REPO):$(VERSION)
