FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Consul Python Client"

RUN dnf install -y net-tools iputils bind-utils

RUN dnf install -y python-pip && \
	pip install --upgrade pip && \
	pip install python-consul

COPY scripts/* /scripts/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
