FROM fedora:latest

ARG NIFI_REGISTRY_VERSION=0.2.0

ARG USERNAME=nifi-registry
ARG GROUPNAME=nifi-registry
ARG UID=1000
ARG GID=1000

RUN dnf install -y wget java-1.8.0-openjdk-devel findutils hostname git && \
	wget http://mirror.vorboss.net/apache/nifi/nifi-registry/nifi-registry-$NIFI_REGISTRY_VERSION/nifi-registry-$NIFI_REGISTRY_VERSION-bin.tar.gz && \
	tar -xzf nifi-registry-$NIFI_REGISTRY_VERSION-bin.tar.gz && \
	rm nifi-registry-$NIFI_REGISTRY_VERSION-bin.tar.gz && \
	mv /nifi-registry-$NIFI_REGISTRY_VERSION /opt && \
	ln -s /opt/nifi-registry-$NIFI_REGISTRY_VERSION/ /opt/nifi-registry && \
	groupadd $GROUPNAME -g $GID && \
    useradd -g $GROUPNAME -u $UID -m $USERNAME && \
    chown $USERNAME:$USERNAME -R /opt/nifi-registry-$NIFI_REGISTRY_VERSION/

RUN mkdir -p /opt/nifi-registry-$NIFI_REGISTRY_VERSION/data/ && \
	chown $USERNAME:$USERNAME /opt/nifi-registry-$NIFI_REGISTRY_VERSION/data

ENV JAVA_HOME=/usr

COPY scripts/*.sh /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/
COPY conf /opt/nifi-registry/conf

USER nifi-registry

EXPOSE 18080

VOLUME ["/home/nifi-registry/.ssh"]

ENTRYPOINT ["entrypoint.sh"]
CMD ["nifi-registry"]