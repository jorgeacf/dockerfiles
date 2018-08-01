FROM fedora:latest

ARG LOGSTASH_VERSION=6.0.0

ENV JAVA_HOME=/usr

ENV LOGSTASH_HOME=/opt/logstash
ENV PATH=$PATH:$LOGSTASH_HOME/bin

RUN dnf install -y wget java && \
	wget https://artifacts.elastic.co/downloads/logstash/logstash-$LOGSTASH_VERSION.tar.gz && \
	tar -xzf logstash-$LOGSTASH_VERSION.tar.gz && \
	rm logstash-$LOGSTASH_VERSION.tar.gz && \
	mv /logstash-$LOGSTASH_VERSION /opt && \
	ln -s /opt/logstash-$LOGSTASH_VERSION/ /opt/logstash

COPY config/*.conf /opt/logstash/config

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]