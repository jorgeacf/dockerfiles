FROM fedora:latest

ARG MAVEN_VERSION=3.5.3
ARG JAVA_VERSION=jdk1.8.0_151

ENV JAVA_HOME=/usr
ENV MAVEN_HOME=/opt/maven
ENV PATH=$PATH:$MAVEN_HOME/bin:$JAVA_HOME/bin

RUN dnf install -y wget java-1.8.0-openjdk-devel && \
	wget http://www-eu.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	mv /apache-maven-$MAVEN_VERSION /opt && \
	ln -s /opt/apache-maven-$MAVEN_VERSION /opt/maven
