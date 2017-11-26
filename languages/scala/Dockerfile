FROM fedora:latest

ARG SCALA_VERSION=2.12.3
ARG JAVA_VERSION=jdk1.8.0_151

ENV PATH=$PATH:/opt/jdk/bin:/opt/scala/bin

RUN dnf install -y wget && \
	
	# Java
	wget --no-check-certificate \
		-c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
		http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz \
		-O $JAVA_VERSION-linux-x64.tar.gz && \
	mkdir /$JAVA_VERSION && \
	tar -xzf $JAVA_VERSION-linux-x64.tar.gz && \
	rm $JAVA_VERSION-linux-x64.tar.gz && \
	mv $JAVA_VERSION /opt && \
	ln -s /opt/$JAVA_VERSION/ /opt/jdk && \

	# SCALA
	wget https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz && \
	tar zxvf scala-$SCALA_VERSION.tgz && \
	rm scala-$SCALA_VERSION.tgz && \
	mv /scala-$SCALA_VERSION /opt && \
	ln -s /opt/scala-$SCALA_VERSION /opt/scala
