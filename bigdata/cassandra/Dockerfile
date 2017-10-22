FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Apache Cassandra"

ENV PATH $PATH:/cassandra/bin


ARG CASSANDRA_VERSION=3.7


ARG TAR="apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz"

WORKDIR /

RUN \
	url="http://www.apache.org/dyn/closer.lua?filename=cassandra/$CASSANDRA_VERSION/$TAR&action=download" && \
	wget -t 100 --retry-connrefused -O "$TAR" "$url" && \
	tar xvf "${TAR}" && \
    rm -fv  "${TAR}" && \
    ln -sv "apache-cassandra-${CASSANDRA_VERSION}" cassandra && \
    rm -fr "cassandra/doc" "cassandra/javadoc" && \
    mkdir /home/cassandra /var/lib/cassandra /var/log/cassandra

EXPOSE 7000 7001 7199 9042 9160

COPY conf /cassandra/conf
COPY entrypoint.sh /

CMD ["/entrypoint.sh"]