FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ARG ZOOKEEPER_VERSION=3.4.12
ARG ZOOKEEPER_TAR="zookeeper-${ZOOKEEPER_VERSION}.tar.gz"

LABEL Description="ZooKeeper"

WORKDIR /

ENV PATH=/opt/zookeeper/bin:${PATH}

RUN wget -O "$ZOOKEEPER_TAR" "http://apache.mirrors.nublue.co.uk/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz" && \
	tar zxvf "${ZOOKEEPER_TAR}" && \
	rm -fv "${ZOOKEEPER_TAR}" && \
	mv /zookeeper-${ZOOKEEPER_VERSION} /opt && \
	ln -sv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper && \
	rm -fr /opt/zookeeper/{src,docs}

RUN mkdir -p /data/{zookeeper,logs}

EXPOSE 2181 3181 4181

COPY config/* /opt/zookeeper/conf/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]