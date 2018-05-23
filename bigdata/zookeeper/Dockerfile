FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ARG ZOOKEEPER_VERSION=3.4.12
ARG ZOOKEEPER_TAR="zookeeper-${ZOOKEEPER_VERSION}.tar.gz"

LABEL Description="ZooKeeper"

ENV ZOOKEEPER_HOME=/opt/zookeeper
ENV PATH=${PATH}:$ZOOKEEPER_HOME/bin

RUN dnf install -y wget java hostname && \
	wget -O "$ZOOKEEPER_TAR" "http://apache.mirrors.nublue.co.uk/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz" && \
	tar zxvf "${ZOOKEEPER_TAR}" && \
	rm -fv "${ZOOKEEPER_TAR}" && \
	mv /zookeeper-${ZOOKEEPER_VERSION} /opt && \
	ln -sv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper && \
	rm -fr /opt/zookeeper/{src,docs} && \
	mkdir -p /data/{zookeeper,logs}

COPY config/* /opt/zookeeper/conf/
COPY entrypoint.sh /usr/local/bin/

RUN groupadd zookeeper && \
    useradd -r -g zookeeper zookeeper && \
    chown zookeeper:zookeeper -R $ZOOKEEPER_HOME && \
    chown zookeeper:zookeeper -R /data

WORKDIR $ZOOKEEPER_HOME

USER zookeeper

EXPOSE 2181 3181 4181

ENTRYPOINT ["entrypoint.sh"]
CMD ["zookeeper"]