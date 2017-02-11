FROM jorgeacf/debian:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Apache Mesos"

ARG MESOS_VERSION=0.28.2

ENV PATH $PATH:/mesos/bin

WORKDIR /

RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends wget && \
    wget -t 10 --retry-connrefused "http://repos.mesosphere.com/debian/pool/main/m/mesos/mesos_$MESOS_VERSION-2.0.27.debian81_amd64.deb" && \
    dpkg -i mesos*.deb; \
    apt-get install -yf && \
    dpkg -i mesos*.deb && \
    apt-get purge -y wget && \
    apt-get autoremove -y && \
    apt-get clean

RUN apt-get -y install systemd 

COPY config/zk /etc/mesos/zk
COPY entrypoint-master.sh /
COPY entrypoint-slave.sh /

EXPOSE 5050 5051

#CMD "/entrypoint.sh"