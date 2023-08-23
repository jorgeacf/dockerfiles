FROM fedora:latest

ARG SBT_VERSION=1.0.2
ARG JAVA_VERSION=jdk1.8.0_151

ENV PATH=$PATH:/opt/jdk/bin:/opt/sbt/bin

RUN dnf install -y wget java-1.8.0-openjdk-devel && \
	wget https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz && \
	tar zxvf sbt-$SBT_VERSION.tgz && \
	rm sbt-$SBT_VERSION.tgz && \
	mv /sbt /opt && \
	sbt sbtVersion