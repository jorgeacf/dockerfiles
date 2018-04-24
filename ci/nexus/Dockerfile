FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Nexus"

ARG NEXUS_VERSION="3.10.0-04"
ARG NEXUS_TAR="nexus-$NEXUS_VERSION-unix.tar.gz"

RUN \
	dnf update -y && \
	dnf install java-1.8.0-openjdk -y  && \
	dnf install wget procps -y && \
	wget -O "$NEXUS_TAR" "http://download.sonatype.com/nexus/3/$NEXUS_TAR" && \
	tar -zxvf $NEXUS_TAR && \
	rm $NEXUS_TAR && \
	mv nexus-$NEXUS_VERSION /opt && \
	ln -s /opt/nexus-$NEXUS_VERSION /opt/nexus

ENV NEXUS_HOME=/opt/nexus
ENV PATH=$PATH:$NEXUS_HOME/bin

EXPOSE 8081

COPY config/nexus.vmoptions /opt/nexus/bin/nexus.vmoptions
COPY entrypoint.sh /

CMD ["/entrypoint.sh"]