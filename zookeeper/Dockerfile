
FROM jorgeacf/os-centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ARG ZOOKEEPER_VERSION=3.4.8
ARG ZOOKEEPER_TAR="zookeeper-${ZOOKEEPER_VERSION}.tar.gz"

ENV PATH $PATH:/zookeeper/bin

LABEL Description="ZooKeeper"

WORKDIR /

RUN \
    wget -O "$ZOOKEEPER_TAR" "http://www.apache.org/dyn/closer.lua?filename=zookeeper/zookeeper-${ZOOKEEPER_VERSION}/${ZOOKEEPER_TAR}&action=download" && \
    tar zxvf "${ZOOKEEPER_TAR}" && \
    rm -fv "${ZOOKEEPER_TAR}" && \
    ln -sv /zookeeper-${ZOOKEEPER_VERSION} /zookeeper && \
    cp -av /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg && \
    rm -fr /zookeeper/{src,docs}

EXPOSE 2181 3181 4181

COPY entrypoint.sh /

CMD /entrypoint.sh