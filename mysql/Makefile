
REPO=jorgeacf/mysql

.PHONY: all
all:
	make build

.PHONY: build
build:
	#@make clear
	docker pull mysql:latest

.PHONY: run
run:
	docker run --name mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:latest