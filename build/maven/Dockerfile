FROM fedora:latest

ARG MAVEN_VERSION=3.5.2
ARG JAVA_VERSION=jdk1.8.0_151

ENV JAVA_HOME=/opt/jdk
ENV PATH=$PATH:/opt/jdk/bin:/opt/maven/bin

RUN dnf install -y wget java-1.8.0-openjdk-devel && \

	# Maven
	wget http://apache.mirrors.nublue.co.uk/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	mv /apache-maven-$MAVEN_VERSION /opt && \
	ln -s /opt/apache-maven-$MAVEN_VERSION /opt/maven
