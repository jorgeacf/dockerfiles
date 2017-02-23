FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Apache Spark"

# Install Spark
ARG SPARK_VERSION=1.6.1
ARG SPARK_HADOOP_VERSION=2.6
ARG SPARK_TAR=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

RUN \
    wget -O "${SPARK_TAR}" "http://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz" && \
    tar -zxvf "${SPARK_TAR}" && \
    rm -fv "${SPARK_TAR}" && \
    ln -s "spark-$SPARK_VERSION-bin-hadoop$SPARK_HADOOP_VERSION" spark

# Hadoop
ARG HADOOP_VERSION=2.7.2
ARG HADOOP_TAR=hadoop-$HADOOP_VERSION.tar.gz

RUN \
	wget -O "$HADOOP_TAR" "http://www.apache.org/dyn/closer.lua?filename=hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-$HADOOP_VERSION.tar.gz&action=download" && \
	tar zxvf "$HADOOP_TAR" && \
	ln -sv hadoop-$HADOOP_VERSION hadoop && \
	rm -r -f "$HADOOP_TAR" && \
	rm -fr /hadoop/share/doc

# Install Apache Livy
ARG LIVY_VERSION=0.2.0

RUN \
 	wget "http://archive.cloudera.com/beta/livy/livy-server-$LIVY_VERSION.zip" && \
 	yum install unzip -y && \
 	unzip livy-server-$LIVY_VERSION.zip && \
 	#yum remove unzip && \
 	ln -s livy-server-$LIVY_VERSION livy && \
 	rm -fv livy-server-$LIVY_VERSION.zip

COPY config /spark/conf
COPY hadoop/conf /hadoop/conf

ENV SPARK_HOME /spark
ENV HADOOP_HOME /hadoop
ENV HADOOP_CONF_DIR /hadoop/conf

ENV PATH $PATH:/$SPARK_HOME/bin:$HADOOP_HOME/bin

ENV MASTER yarn

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd && \
	cp -v /spark/conf/spark-env.sh.template /spark/conf/spark-env.sh

COPY entrypoint.sh /

# Livy Rest port
EXPOSE 8998

EXPOSE 4040 7077 8080 8081

ENTRYPOINT ["/entrypoint.sh"]