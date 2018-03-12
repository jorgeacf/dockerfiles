FROM fedora:latest

ARG NIFI_VERSION=1.5.0

ARG UID=1000
ARG GID=1000

RUN dnf install -y wget && \
	wget http://mirror.ox.ac.uk/sites/rsync.apache.org/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz && \
	tar -xzf nifi-$NIFI_VERSION-bin.tar.gz && \
	rm nifi-$NIFI_VERSION-bin.tar.gz && \
	mv /nifi-$NIFI_VERSION /opt && \
	ln -s /opt/nifi-$NIFI_VERSION/ /opt/nifi

RUN wget --no-cookies --no-check-certificate \
	--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
	"http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jre-8u162-linux-x64.rpm" && \
	dnf -y localinstall jre-8u162-linux-x64.rpm && \
	rm jre-8u162-linux-x64.rpm

ENV JAVA_HOME=/usr/java/latest

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