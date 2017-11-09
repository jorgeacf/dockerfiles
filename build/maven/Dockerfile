FROM fedora:latest

ARG MAVEN_VERSION=3.5.2
ARG JAVA_VERSION=jdk1.8.0_151

ENV JAVA_HOME=/opt/jdk
ENV PATH=$PATH:/opt/jdk/bin:/opt/maven/bin

RUN dnf install -y wget which && \
	
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

	# Maven
	wget http://apache.mirrors.nublue.co.uk/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	mv /apache-maven-$MAVEN_VERSION /opt && \
	ln -s /opt/apache-maven-$MAVEN_VERSION /opt/maven
