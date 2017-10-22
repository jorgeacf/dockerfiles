FROM centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Nexus"

ARG NEXUS_VERSION="2.14.5-02"
ARG NEXUS_TAR=nexus-$NEXUS_VERSION-bundle.tar.gz

RUN \
	yum update -y && \
	yum install java-1.8.0-openjdk-headless -y  && \
	yum install wget -y && \
	wget -O "$NEXUS_TAR" "http://www.sonatype.org/downloads/nexus-$NEXUS_VERSION-bundle.tar.gz" && \
	tar xvzf $NEXUS_TAR && \
	ln -s nexus-$NEXUS_VERSION nexus && \
	rm $NEXUS_TAR

EXPOSE 8081

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]