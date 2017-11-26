FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ARG ZOOKEEPER_VERSION=3.4.11
ARG ZOOKEEPER_TAR="zookeeper-${ZOOKEEPER_VERSION}.tar.gz"

LABEL Description="ZooKeeper"

WORKDIR /

ENV PATH=/zookeeper/bin:${PATH}

RUN wget -O "$ZOOKEEPER_TAR" "http://apache.mirror.anlx.net/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz" && \
	tar zxvf "${ZOOKEEPER_TAR}" && \
	rm -fv "${ZOOKEEPER_TAR}" && \
	ln -sv /zookeeper-${ZOOKEEPER_VERSION} /zookeeper && \
	cp -av /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg && \
	rm -fr /zookeeper/{src,docs}

RUN mkdir -p /zookeeper/{data,wal,log}
RUN mkdir -p /tmp/zookeeper
RUN cp /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg

#RUN echo "standaloneEnabled=false" >> /zookeeper/conf/zoo.cfg
#RUN echo "dynamicConfigFile=/zookeeper/conf/zoo.cfg.dynamic" >> /zookeeper/conf/zoo.cfg

EXPOSE 2181 3181 4181

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]