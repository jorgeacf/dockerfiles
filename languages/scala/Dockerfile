FROM fedora:latest

ARG SCALA_VERSION=2.12.3
ARG JAVA_VERSION=jdk1.8.0_144

ENV PATH=$PATH:/opt/jdk/bin:/opt/scala/bin

RUN dnf install -y wget && \
	
	# Java
	wget --no-cookies \
		--no-check-certificate \
		--header "Cookie: oraclelicense=accept-securebackup-cookie" \
		"http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz" \
		-O $JAVA_VERSION-linux-x64.tar.gz && \
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
