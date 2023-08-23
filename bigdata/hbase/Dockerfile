FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Apache HBase"

ARG HBASE_VERSION=1.2.4

ENV PATH $PATH:/hbase/bin

WORKDIR /

RUN wget -t 100 --retry-connrefused -O "hbase-$HBASE_VERSION-bin.tar.gz" "http://archive.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz" && \
	mkdir hbase-$HBASE_VERSION && \
	tar zxvf hbase-$HBASE_VERSION-bin.tar.gz -C hbase-$HBASE_VERSION --strip 1 && \
	ln -sv hbase-$HBASE_VERSION hbase && \
	rm -fv hbase-$HBASE_VERSION-bin.tar.gz && \
	rm -fr /hbase/docs /hbase/src && \
	yum install -y openssh-server openssh-clients

COPY config/ /hbase/conf/

COPY hdfs-conf/ /hdfs/conf
ENV HADOOP_CONF_DIR /hdfs/conf

# ssh without key
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '' && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
COPY config/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config

COPY entrypoint.sh /

EXPOSE 2181 8080 8085 9090 9095 16000 16010 16201 16301

CMD ["/entrypoint.sh"]