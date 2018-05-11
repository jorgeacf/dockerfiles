FROM fedora:latest

ARG LOGSTASH_VERSION=6.0.0

RUN dnf install -y wget && \
	wget https://artifacts.elastic.co/downloads/logstash/logstash-$LOGSTASH_VERSION.tar.gz && \
	tar -xzf logstash-$LOGSTASH_VERSION.tar.gz && \
	rm logstash-$LOGSTASH_VERSION.tar.gz && \
	mv /logstash-$LOGSTASH_VERSION /opt && \
	ln -s /opt/logstash-$LOGSTASH_VERSION/ /opt/logstash

COPY config/*.conf /opt/logstash/config