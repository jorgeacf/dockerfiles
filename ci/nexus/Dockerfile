FROM jorgeacf/os-centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Nexus"

ENV NEXUS_VERSION="2.14.0-01"

RUN yum install wget -y
RUN wget -O "nexus-$NEXUS_VERSION-bundle.tar.gz" "http://www.sonatype.org/downloads/nexus-$NEXUS_VERSION-bundle.tar.gz"
RUN tar xvzf nexus-$NEXUS_VERSION-bundle.tar.gz
RUN ln -s nexus-$NEXUS_VERSION nexus

EXPOSE 8081

COPY entrypoint.sh /

CMD /entrypoint.sh