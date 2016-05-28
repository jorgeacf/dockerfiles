
REPO=jorgeacf/spark

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):latest .

.PHONY: nocache
nocache:
	docker build -t $(REPO):latest --no-cache .

.PHONY: run
run:
	docker run -ti -p 4040:4040 -p 7077:7077 -p 8080:8080 -p 8081:8081 $(REPO):latest