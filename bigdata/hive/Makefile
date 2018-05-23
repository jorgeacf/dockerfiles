REPO=jorgeacf/hive

include ../../Makefile.main

.PHONY: run
run:
        @docker run -it $(REPO):$(VERSION)

run-x:
        docker run -itd --volume nifi_hadoop_home:/opt/hadoop jorgeacf/hive:2.3.3 bash