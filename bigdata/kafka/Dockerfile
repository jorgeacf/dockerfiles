
FROM jorgeacf/os-centos
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ARG SCALA_VERSION=2.11
ARG KAFKA_VERSION=0.10.0.0

LABEL Description="Kafka"

RUN \
	wget -O "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" "https://www.apache.org/dyn/closer.cgi?filename=/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz&action=download" && \
    tar zxvf "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    rm -fv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    ln -sv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}" kafka

COPY config/server.properties /kafka/config/server.properties

COPY entrypoint.sh /

EXPOSE 2181 9092

CMD /entrypoint.sh