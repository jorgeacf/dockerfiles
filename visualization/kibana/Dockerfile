FROM fedora:latest

ARG KIBANA_VERSION=6.2.4

ENV PATH=/opt/kibana/bin:$PATH

RUN dnf update -y && dnf install -y wget libstdc++-devel && \

	wget https://artifacts.elastic.co/downloads/kibana/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz && \
	tar -xzf kibana-$KIBANA_VERSION-linux-x86_64.tar.gz && \
	rm kibana-$KIBANA_VERSION-linux-x86_64.tar.gz && \
	mv /kibana-$KIBANA_VERSION-linux-x86_64 /opt/kibana-$KIBANA_VERSION && \
	ln -s /opt/kibana-$KIBANA_VERSION/ /opt/kibana && \
	dnf clean all

COPY config/kibana.yml /opt/kibana/config/
COPY entrypoint.sh /

ARG user=kibana
ARG group=kibana
ARG uid=1000
ARG gid=1000

RUN useradd --home /home/${user} ${user}
RUN usermod -G ${user} ${user}

#RUN chown -R ${user} /opt/kibana/

USER ${user}

EXPOSE 5601

ENTRYPOINT ["/entrypoint.sh"]