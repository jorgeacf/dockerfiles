FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Zeppelin"

ARG ZEPPELIN_VERSION=0.7.3
ARG ZEPPELIN_TAR="zeppelin-$ZEPPELIN_VERSION-bin-all.tgz"

ENV ZEPPELIN_HOME=/opt/zeppelin
ENV PATH=$PATH:$ZEPPELIN_HOME/bin

RUN dnf install -y wget java-1.8.0-openjdk-devel findutils hostname && \
	wget -O "$ZEPPELIN_TAR" "http://apache.mirror.anlx.net/zeppelin/zeppelin-$ZEPPELIN_VERSION/$ZEPPELIN_TAR" && \
	tar zxvf "${ZEPPELIN_TAR}" && \
	rm -fv "${ZEPPELIN_TAR}" && \
	mv /zeppelin-$ZEPPELIN_VERSION-bin-all /opt/zeppelin-$ZEPPELIN_VERSION-bin-all && \
	ln -sv /opt/zeppelin-$ZEPPELIN_VERSION-bin-all /opt/zeppelin && \
	rm -r /opt/zeppelin/notebook/*

#RUN groupadd zeppelin && useradd -g zeppelin zeppelin
#RUN chown -R zeppelin /opt/zeppelin/

COPY entrypoint.sh /usr/local/bin/
COPY config/* /opt/zeppelin/conf/

WORKDIR $ZEPPELIN_HOME

#USER zeppelin

EXPOSE 8080

VOLUME ["/opt/zeppelin/notebook"]

ENTRYPOINT ["entrypoint.sh"]
CMD ["zeppelin"]