
FROM jorgeacf/os-centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Hadoop"

ARG HADOOP_VERSION=2.7.2
ARG HADOOP_TAR=hadoop-$HADOOP_VERSION.tar.gz

WORKDIR /

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.91-6.b14.fc23.x86_64/jre/bin/java
ENV HADOOP_HOME=/hadoop
ENV PATH=$PATH:$JAVA_HOME/bin
ENV PATH=$PATH:$HADOOP_HOME/bin

RUN yum install -y openssh-server
RUN wget -O "$HADOOP_TAR" "http://www.apache.org/dyn/closer.lua?filename=hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-$HADOOP_VERSION.tar.gz&action=download"
RUN tar zxvf "$HADOOP_TAR"
RUN ln -sv hadoop-$HADOOP_VERSION hadoop
RUN yum autoremove -y
RUN yum clean all

# ssh without key
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '' && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

COPY entrypoint.sh /
COPY config/core-site.xml /hadoop/etc/hadoop/
COPY config/hdfs-site.xml /hadoop/etc/hadoop/
COPY config/yarn-site.xml /hadoop/etc/hadoop/
COPY config/mapred-site.xml /hadoop/etc/hadoop/
COPY config/slaves /hadoop/etc/hadoop/slaves
COPY config/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config

# Example for debug
COPY run-word-count.sh /

RUN mkdir -p /root/hdfs/namenode && \ 
    mkdir -p /root/hdfs/datanode && \
    mkdir /hadoop/logs

# Format namenode
RUN /hadoop/bin/hdfs namenode -format

CMD /entrypoint.sh

# HDFS ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000

# Mapred ports
EXPOSE 19888

#YARN ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088

#Other ports
EXPOSE 49707 2122