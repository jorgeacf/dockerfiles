
REPO=jorgeacf/kafka

.PHONY: all
all:
	make build

.PHONY: build
build:
	#@make clear
	docker build -t $(REPO):latest .

.PHONY: nocache
nocache:
	docker build -t $(REPO):latest --no-cache .

.PHONY: run
run:
	docker run -ti -p 2181:2181 -p 9092:9092 $(REPO):latest

.PHONY: run-multi
run-multi:

	echo 'Starting Kafka #1...'
	docker run -itd --name kafka1 -h kafka1 -e SERVERS='kafka1,kafka2,kafka3' $(REPO):latest

	echo 'Starting Kafka #2...'
	docker run -itd --name kafka2 -h kafka2 -e SERVERS='kafka1,kafka2,kafka3' $(REPO):latest

	echo 'Starting Kafka #3...'
	docker run -itd --name kafka3 -h kafka3 -e SERVERS='kafka1,kafka2,kafka3' $(REPO):latest

	echo 'Updating hostnames on containers...'
	../scripts/docker-update-all-containers-hosts.sh

.PHONY: clear
clear:

	docker stop kafka1
	docker stop kafka2
	docker stop kafka3

	docker rm kafka1
	docker rm kafka2
	docker rm kafka3