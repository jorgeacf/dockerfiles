FROM fedora:latest

ARG ATLAS_VERSION=0.8.2

RUN dnf install -y wget java maven && \
	wget http://mirror.metrocast.net/apache/atlas/$ATLAS_VERSION/apache-atlas-$ATLAS_VERSION-sources.tar.gz  && \
	tar -xzf apache-atlas-$ATLAS_VERSION-sources.tar.gz && \
	rm apache-atlas-$ATLAS_VERSION-sources.tar.gz && \
	cd /apache-atlas-sources-$ATLAS_VERSION && \
	mvn clean -DskipTests package -Pdist,embedded-hbase-solr

RUN cd /apache-atlas-sources-0.8.2/distro/target/ && \
	tar -xzvf apache-atlas-$ATLAS_VERSION-bin.tar.gz && \
	mv apache-atlas-$ATLAS_VERSION /opt/apache-atlas-$ATLAS_VERSION && \
	cd / && \
	rm -r /apache-atlas-sources-$ATLAS_VERSION && \
	ln -s /opt/atlas-$ATLAS_VERSION/ /opt/atlas

RUN dnf install -y python net-tools

COPY config/atlas-application.properties /opt/apache-atlas-0.8.2/conf/atlas-application.properties

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]