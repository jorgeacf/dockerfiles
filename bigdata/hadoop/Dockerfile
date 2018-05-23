FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Hadoop"

ARG HADOOP_VERSION=2.9.1
ARG HADOOP_TAR=hadoop-$HADOOP_VERSION.tar.gz

WORKDIR /

RUN \
	dnf install -y wget java which procps openssh-server openssh-clients && \
	wget -O "$HADOOP_TAR" "http://www-eu.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz" && \
	tar zxvf "$HADOOP_TAR" && \
	mv hadoop-$HADOOP_VERSION /opt/hadoop-$HADOOP_VERSION && \
	ln -sv /opt/hadoop-$HADOOP_VERSION /opt/hadoop && \
	rm -r -f "$HADOOP_TAR" && \
	rm -fr /opt/hadoop/share/doc && \
	dnf autoremove -y && \
	dnf clean all

# set environment variable
ENV JAVA_HOME=/usr
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$PATH:$JAVA_HOME/bin
ENV PATH=$PATH:$HADOOP_HOME/bin

# ssh without key
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '' && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys && \
	ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
	ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa && \
	ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519

COPY config/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config

COPY entrypoint.sh /
COPY entrypoint-node-manager.sh /
COPY entrypoint-resource-manager.sh /

# Configuration
COPY config/*.* /opt/hadoop/etc/hadoop/

# Example for debug
COPY /tests /tests

RUN mkdir -p /root/hdfs/namenode && \
    mkdir -p /root/hdfs/datanode && \
    mkdir /opt/hadoop/logs

VOLUME ["/opt/hadoop-$HADOOP_VERSION"]

# Format namenode
RUN /opt/hadoop/bin/hdfs namenode -format

# HDFS ports
EXPOSE 50010 50020 50070 50075 50090 8020 9000

# Mapred ports
EXPOSE 19888

#YARN ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088

#Other ports
EXPOSE 49707 2122

#CMD ["/entrypoint.sh"]