
FROM jorgeacf/os-centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Hadoop"

ARG HADOOP_VERSION=2.7.2
ARG HADOOP_TAR=hadoop-$HADOOP_VERSION.tar.gz

ENV JAVA_HOME /usr
ENV PATH $PATH:/hadoop/bin

WORKDIR /

RUN \
	yum install -y openssh-server && \
	wget -O "$HADOOP_TAR" "http://www.apache.org/dyn/closer.lua?filename=hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-$HADOOP_VERSION.tar.gz&action=download" && \
	tar zxvf "$HADOOP_TAR" && \
	ln -sv hadoop-$HADOOP_VERSION hadoop && \
    /hadoop/bin/hdfs namenode -format && \
    yum autoremove -y && \
    yum clean all

COPY entrypoint.sh /
COPY config/core-site.xml /hadoop/etc/hadoop/
COPY config/hdfs-site.xml /hadoop/etc/hadoop/
COPY config/yarn-site.xml /hadoop/etc/hadoop/
COPY config/mapred-site.xml /hadoop/etc/hadoop/

EXPOSE 8020 8042 8088 9000 10020 19888 50010 50020 50070 50075 50090

CMD "/entrypoint.sh"