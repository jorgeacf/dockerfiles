FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Docker Python Client"

RUN dnf install -y python-pip && \
	pip install --upgrade pip && \
	pip install docker

COPY scripts/* /scripts/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
