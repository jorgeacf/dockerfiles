FROM fedora:latest

ARG NIFI_VERSION=1.6.0

ARG UID=1000
ARG GID=1000

RUN dnf install -y wget java && \
	wget http://apache.mirror.anlx.net/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz && \
	tar -xzf nifi-$NIFI_VERSION-bin.tar.gz && \
	rm nifi-$NIFI_VERSION-bin.tar.gz && \
	mv /nifi-$NIFI_VERSION /opt && \
	ln -s /opt/nifi-$NIFI_VERSION/ /opt/nifi

ENV JAVA_HOME=/usr

COPY conf /opt/nifi/conf

ENV NIFI_HOME /opt/nifi

# Setup NiFi user
#RUN groupadd -g $GID nifi || groupmod -n nifi `getent group $GID | cut -d: -f1` && \
#	useradd --shell /bin/bash -u $UID -g $GID -m nifi && \
#   	mkdir -p $NIFI_HOME/data/templates && \
#	chown -R nifi:nifi $NIFI_HOME && \
#	chown -R nifi:nifi /opt/nifi-$NIFI_VERSION

#USER nifi

#WORKDIR /opt/nifi-$NIFI_VERSION

EXPOSE 8080 8181

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]