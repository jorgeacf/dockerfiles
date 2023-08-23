FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ARG SPARK_VERSION=1.6.1
ARG HADOOP_VERSION=2.6
ARG SPARK_TAR=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

ENV PATH $PATH:/spark/bin

LABEL Description="Apache Spark"

RUN \
    wget -O "${SPARK_TAR}" "http://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" && \
    tar -zxvf "${SPARK_TAR}" && \
    rm -fv "${SPARK_TAR}" && \
    ln -s "spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION" spark

COPY config /spark/conf
COPY hadoop/conf /hadoop/conf
ENV HADOOP_CONF_DIR /hadoop/conf

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd && \
	cp -v /spark/conf/spark-env.sh.template /spark/conf/spark-env.sh

COPY entrypoint.sh /

EXPOSE 4040 7077 8080 8081

ENTRYPOINT ["/entrypoint.sh"]