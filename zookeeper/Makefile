REPO=jorgeacf/zookeeper

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
	docker run -ti --name zookeeper-single -p 2181:2181 $(REPO):latest

.PHONY: run-multi
run-multi:

	echo 'Starting Zookeeper #1...'
	docker run -itd --name zookeeper1 --hostname zookeeper1 -e MYID=1 -e SERVERS=zookeeper1,zookeeper2,zookeeper3 $(REPO):latest

	echo 'Starting Zookeeper #2...'
	docker run -itd --name zookeeper2 --hostname zookeeper2 -e MYID=2 -e SERVERS=zookeeper1,zookeeper2,zookeeper3 $(REPO):latest

	echo 'Starting Zookeeper #3...'
	docker run -itd --name zookeeper3 --hostname zookeeper3 -e MYID=3 -e SERVERS=zookeeper1,zookeeper2,zookeeper3 $(REPO):latest

	docker ps -q | xargs -n 1 docker inspect --format '{{ .NetworkSettings.IPAddress }} {{ .Name }}' | sed 's/ \// /' > hosts
	docker cp hosts zookeeper1:hosts
	docker cp hosts zookeeper2:hosts
	docker cp hosts zookeeper3:hosts
	docker exec zookeeper1 /bin/sh -c "cat hosts > /etc/hosts"
	docker exec zookeeper2 /bin/sh -c "cat hosts > /etc/hosts"
	docker exec zookeeper3 /bin/sh -c "cat hosts > /etc/hosts"
	rm hosts

.PHONY: run-multi2
run-multi2:

	docker-compose up