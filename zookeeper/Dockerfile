
FROM jorgeacf/os-centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ARG ZOOKEEPER_VERSION=3.4.8
ARG ZOOKEEPER_TAR="zookeeper-${ZOOKEEPER_VERSION}.tar.gz"

LABEL Description="ZooKeeper"

WORKDIR /

RUN wget -O "$ZOOKEEPER_TAR" "http://www.apache.org/dyn/closer.lua?filename=zookeeper/zookeeper-${ZOOKEEPER_VERSION}/${ZOOKEEPER_TAR}&action=download"
RUN tar zxvf "${ZOOKEEPER_TAR}"
RUN rm -fv "${ZOOKEEPER_TAR}"
RUN ln -sv /zookeeper-${ZOOKEEPER_VERSION} /zookeeper
RUN cp -av /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg
RUN rm -fr /zookeeper/{src,docs}
RUN rm -fr /zookeeper-${ZOOKEEPER_VERSION}

EXPOSE 2181 3181 4181

COPY entrypoint.sh /

CMD /entrypoint.sh