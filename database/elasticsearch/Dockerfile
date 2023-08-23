FROM fedora:latest

ARG ELASTICSEARCH_VERSION=6.2.4

ENV JAVA_HOME=/usr
ENV PATH=$JAVA_HOME:$PATH
ENV PATH=/opt/elasticsearch/bin:$PATH

RUN dnf update -y && dnf install -y wget findutils java && \

	wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
	tar -xzf elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
	rm elasticsearch-$ELASTICSEARCH_VERSION.tar.gz && \
	mv /elasticsearch-$ELASTICSEARCH_VERSION /opt/elasticsearch-$ELASTICSEARCH_VERSION && \
	ln -s /opt/elasticsearch-$ELASTICSEARCH_VERSION/ /opt/elasticsearch && \
	dnf clean all

COPY config/* /opt/elasticsearch/config/
COPY entrypoint.sh /

ARG user=elasticsearch
ARG group=elasticsearch
ARG uid=1000
ARG gid=1000

RUN useradd --home /home/${user} ${user}
RUN usermod -G ${user} ${user}

RUN chown -R ${user} /opt/elasticsearch/

USER ${user}

EXPOSE 9200 9300

ENTRYPOINT ["/entrypoint.sh"]