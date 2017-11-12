FROM fedora:latest

ARG SBT_VERSION=1.0.2
ARG JAVA_VERSION=jdk1.8.0_151

ENV PATH=$PATH:/opt/jdk/bin:/opt/sbt/bin

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

	# Sbt
	wget https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz && \
	tar zxvf sbt-$SBT_VERSION.tgz && \
	rm sbt-$SBT_VERSION.tgz && \
	mv /sbt /opt && \
	sbt sbtVersion