FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Apache Hive"

ARG HIVE_VERSION=2.3.3

ENV HIVE_HOME /opt/hive
ENV HADOOP_HOME /opt/hadoop

ENV PATH $PATH:$HIVE_HOME/bin
ENV PATH $PATH:$HADOOP_HOME/bin

RUN dnf install -y wget java which procps && \
	wget http://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
	rm -rf /var/lib/apt/lists/* && \
	tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
	rm apache-hive-$HIVE_VERSION-bin.tar.gz && \
	mv apache-hive-$HIVE_VERSION-bin /opt/hive-$HIVE_VERSION-bin && \
	ln -sv /opt/hive-$HIVE_VERSION-bin /opt/hive

WORKDIR /opt/hive

COPY config /hive/conf

EXPOSE 10000 10001 10002

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["hive"]