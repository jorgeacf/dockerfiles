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
	docker run -itd --net=hadoop --name zookeeper1 --hostname zookeeper1 -e MYID=1 -e SERVERS=zookeeper1,zookeeper2,zookeeper3 $(REPO):latest

	echo 'Starting Zookeeper #2...'
	docker run -itd --net=hadoop --name zookeeper2 --hostname zookeeper2 -e MYID=2 -e SERVERS=zookeeper1,zookeeper2,zookeeper3 $(REPO):latest

	echo 'Starting Zookeeper #3...'
	docker run -itd --net=hadoop --name zookeeper3 --hostname zookeeper3 -e MYID=3 -e SERVERS=zookeeper1,zookeeper2,zookeeper3 $(REPO):latest

	#echo 'Updating hostnames on containers...'
	#../scripts/docker-update-all-containers-hosts.sh