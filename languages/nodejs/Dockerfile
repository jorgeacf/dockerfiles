FROM jorgeacf/os-centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Node.js"

ARG NODEJS_VERSION=7.5.0
ARG NODEJS_TAR=node-$NODEJS_VERSION-linux-x64.tar.xz

WORKDIR /

RUN \
	wget -O "$NODEJS_TAR" "https://nodejs.org/dist/v7.5.0/node-v7.5.0-linux-x64.tar.xz" && \
	tar xf "$NODEJS_TAR" && \
	ln -sv node-v$NODEJS_VERSION-linux-x64 nodejs && \
	rm -r -f "$NODEJS_TAR"

# set environment variables
ENV NODEJS_HOME=/nodejs
ENV PATH=$PATH:$NODEJS_HOME/bin

COPY entrypoint.sh /
COPY server.js /

EXPOSE 80

CMD ["/entrypoint.sh"]
