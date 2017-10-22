FROM jorgeacf/hadoop:2.7.2
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Apache Hive"

ARG HIVE_VERSION=2.1.0

ENV HIVE_HOME /hive
ENV PATH $PATH:$HIVE_HOME/bin

RUN wget http://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
	rm -rf /var/lib/apt/lists/* && \
	tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
	mv apache-hive-$HIVE_VERSION-bin hive && \
	rm apache-hive-$HIVE_VERSION-bin.tar.gz

COPY config /hive/conf

EXPOSE 10002

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]