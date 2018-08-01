FROM fedora:latest

ARG NIFI_REGISTRY_VERSION=0.2.0

RUN dnf install -y wget java-1.8.0-openjdk-devel findutils hostname git && \
	wget http://mirror.vorboss.net/apache/nifi/nifi-registry/nifi-registry-$NIFI_REGISTRY_VERSION/nifi-registry-$NIFI_REGISTRY_VERSION-bin.tar.gz && \
	tar -xzf nifi-registry-$NIFI_REGISTRY_VERSION-bin.tar.gz && \
	rm nifi-registry-$NIFI_REGISTRY_VERSION-bin.tar.gz && \
	mv /nifi-registry-$NIFI_REGISTRY_VERSION /opt && \
	ln -s /opt/nifi-registry-$NIFI_REGISTRY_VERSION/ /opt/nifi-registry

ENV JAVA_HOME=/usr

COPY entrypoint.sh /usr/local/bin/
#COPY conf /opt/nifi-registry/conf

EXPOSE 18080

ENTRYPOINT ["entrypoint.sh"]
CMD ["nifi-registry"]