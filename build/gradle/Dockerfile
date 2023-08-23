FROM fedora:latest

ARG GRADLE_VERSION=4.7
ARG JAVA_VERSION=jdk1.8.0_151

ENV PATH=$PATH:/opt/jdk/bin:/opt/gradle/bin

RUN dnf install -y wget unzip java-1.8.0-openjdk-devel && \
	wget https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
	unzip gradle-$GRADLE_VERSION-bin.zip && \
	rm gradle-$GRADLE_VERSION-bin.zip && \
	mv /gradle-$GRADLE_VERSION /opt && \
	ln -s /opt/gradle-$GRADLE_VERSION /opt/gradle
