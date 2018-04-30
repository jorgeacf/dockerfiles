FROM fedora:latest

ARG PORTAINER_VERSION=1.16.5

RUN \
	yum install wget python docker -y && \
	pip install docker && \
	wget https://github.com/portainer/portainer/releases/download/$PORTAINER_VERSION/portainer-$PORTAINER_VERSION-linux-amd64.tar.gz && \
	tar xvpfz portainer-$PORTAINER_VERSION-linux-amd64.tar.gz && \
	rm portainer-$PORTAINER_VERSION-linux-amd64.tar.gz && \
	mv portainer /opt && \
	mkdir /data

EXPOSE 9000

COPY scripts/* /opt/scripts/

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]
