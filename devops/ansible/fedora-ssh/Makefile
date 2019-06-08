REPO := jorgeacf/fedora-ssh

include ../../../Makefile.main

.PHONY: build
build:
	@docker build -t $(REPO):$(VERSION) .

.PHONY: run
run:
	
	for number in 1 2 3 4 ; do \
		CONTAINER_ID=`docker run -it $(REPO):$(VERSION)` ; \
		#CONTAINER_IP=`docker inspect -f "{{ .NetworkSettings.IPAddress }}" 1c` ; \
	   	echo $$ CONTAINER_ID ; \
	   	echo $$number ; \
	done

.PHONY: run-d
run-d:
	@docker run -itd $(REPO):$(VERSION)