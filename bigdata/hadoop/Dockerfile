FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Hadoop"

ARG HADOOP_VERSION=2.8.2
ARG HADOOP_TAR=hadoop-$HADOOP_VERSION.tar.gz

WORKDIR /

RUN \
	yum install -y openssh-server openssh-clients && \
	wget -O "$HADOOP_TAR" "http://www.apache.org/dyn/closer.lua?filename=hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-$HADOOP_VERSION.tar.gz&action=download" && \
	tar zxvf "$HADOOP_TAR" && \
	ln -sv hadoop-$HADOOP_VERSION hadoop && \
	rm -r -f "$HADOOP_TAR" && \
	rm -fr /hadoop/share/doc && \
	yum autoremove -y && \
	yum clean all

# set environment variable
ENV JAVA_HOME=/usr
ENV HADOOP_HOME=/hadoop
ENV PATH=$PATH:$JAVA_HOME/bin
ENV PATH=$PATH:$HADOOP_HOME/bin

# ssh without key
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '' && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
COPY config/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config

COPY entrypoint.sh /
COPY entrypoint-node-manager.sh /
COPY entrypoint-resource-manager.sh /

# Configuration
COPY config/*.* /hadoop/etc/hadoop/

# Example for debug
COPY /tests /tests

RUN mkdir -p /root/hdfs/namenode && \
    mkdir -p /root/hdfs/datanode && \
    mkdir /hadoop/logs

# Format namenode
RUN /hadoop/bin/hdfs namenode -format

# HDFS ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000

# Mapred ports
EXPOSE 19888

#YARN ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088

#Other ports
EXPOSE 49707 2122

#CMD ["/entrypoint.sh"]