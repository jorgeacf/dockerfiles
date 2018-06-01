
REPO=jorgeacf/xxx
VERSION=latest

.PHONY: build
build:
	@docker build -t $(REPO):$(VERSION) .

.PHONY: run
run:
	docker run -it --rm $(REPO):$(VERSION)

.PHONY: run-u
run-u:
	docker run -it \
	-u $$UID \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/group:/etc/group:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v /home:/home \
	${REPO}:${VERSION}

.PHONY: run-ssh
run-ssh:
	docker run -it \
	-u $$UID \
	-v /etc/passwd:/etc/passwd:ro \
	-v /etc/group:/etc/group:ro \
	-v /etc/localtime:/etc/localtime:ro \
	-v ~/.ssh:/home/jorgeacf/.ssh \
	${REPO}:${VERSION}