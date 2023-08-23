FROM jorgeacf/centos
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ARG SCALA_VERSION=2.11
ARG KAFKA_VERSION=0.11.0.1
ARG KAFKA_MANAGER_VERSION=1.3.3.14

LABEL Description="Kafka"

RUN \
	wget -O "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" "https://www.apache.org/dyn/closer.cgi?filename=/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz&action=download" && \
    tar zxvf "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    rm -fv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    ln -sv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}" kafka

RUN \
	yum install -y java-1.8.0-openjdk-devel unzip which && \
	wget -O "kafka-manager-$KAFKA_MANAGER_VERSION.tar.gz" "https://github.com/yahoo/kafka-manager/archive/$KAFKA_MANAGER_VERSION.tar.gz" && \
	tar -xzf kafka-manager-$KAFKA_MANAGER_VERSION.tar.gz && \
	rm -fv kafka-manager-$KAFKA_MANAGER_VERSION.tar.gz && \
	mv kafka-manager-$KAFKA_MANAGER_VERSION kafka-manager-$KAFKA_MANAGER_VERSION-src && \
	cd kafka-manager-$KAFKA_MANAGER_VERSION-src && \
	./sbt clean dist && \
	unzip  -d / ./target/universal/kafka-manager-${KAFKA_MANAGER_VERSION}.zip && \
	rm -fr /root/.sbt /root/.ivy2 /kafka-manager-$KAFKA_MANAGER_VERSION-src && \
#	ln -sv /kafka-manager-1.3.3.14 kafka-manager && \
	yum autoremove -y java-1.8.0-openjdk-devel unzip which && \
    yum clean all

ENV ZK_HOSTS=zookeeper1:2181

COPY config/server.properties /kafka/config/server.properties

COPY entrypoint.sh /

EXPOSE 2181 8080 9092

CMD ["/entrypoint.sh"]