FROM fedora:latest

ARG NIFI_REGISTRY_VERSION=0.1.0

RUN dnf install -y wget && \
	wget http://mirror.vorboss.net/apache/nifi/nifi-registry/nifi-registry-$NIFI_REGISTRY_VERSION/nifi-registry-$NIFI_REGISTRY_VERSION-bin.tar.gz && \
	tar -xzf nifi-registry-$NIFI_REGISTRY_VERSION-bin.tar.gz && \
	rm nifi-registry-$NIFI_REGISTRY_VERSION-bin.tar.gz && \
	mv /nifi-registry-$NIFI_REGISTRY_VERSION /opt && \
	ln -s /opt/nifi-registry-$NIFI_REGISTRY_VERSION/ /opt/nifi-registry

RUN wget --no-cookies --no-check-certificate \
	--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
	"http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.rpm" && \
	dnf -y localinstall jdk-8u162-linux-x64.rpm && \
	rm jdk-8u162-linux-x64.rpm

ENV JAVA_HOME=/usr/java/latest

COPY conf /opt/nifi-registry/conf

EXPOSE 18080

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]