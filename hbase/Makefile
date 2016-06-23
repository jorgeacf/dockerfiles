
REPO=jorgeacf/hbase

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):latest .

.PHONY: run
run:
	docker run -ti \
		-p 2181:2181 -p 8080:8080 -p 8085:8085 \
		-p 9090:9090 -p 9095:9095 -p 16000:16000 \
		-p 16010:16010 -p 16201:16201 -p 16301:16301 \
		--name hbase-master \
		--hostname hbase-master \
		$(REPO):latest

.PHONY: run-multi
run-multi:

