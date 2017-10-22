FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ARG ZEPPELIN_VERSION=0.7.2
ARG ZEPPELIN_TAR="zeppelin-$ZEPPELIN_VERSION-bin-all.tgz"

LABEL Description="Zeppelin"

WORKDIR /

RUN wget -O "$ZEPPELIN_TAR" "http://apache.mirror.anlx.net/zeppelin/zeppelin-$ZEPPELIN_VERSION/$ZEPPELIN_TAR" && \
	tar zxvf "${ZEPPELIN_TAR}" && \
	rm -fv "${ZEPPELIN_TAR}" && \
	ln -sv /zeppelin-$ZEPPELIN_VERSION-bin-all /zeppelin

EXPOSE 8080

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]