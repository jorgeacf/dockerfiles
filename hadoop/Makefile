
REPO=jorgeacf/hadoop

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
	docker run -ti \
	-p 50010:50010 -p 50020:50020 -p 50070:50070 -p 50075:50075 -p 50090:50090 -p 8020:8020 -p 9000:9000 \
	-p 19888:19888 \
	-p 8030:8030 -p 8031:8031 -p 8032:8032 -p 8033:8033 -p 8040:8040 -p 8042:8042 -p 8088:8088 \
	-p 49707:49707 -p 2122:2122 \
	jorgeacf/hadoop:latest