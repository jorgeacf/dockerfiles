FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Apache Flink"

ARG FLINK_VERSION=1.1.2
ARG FLINK_TAR=flink-$FLINK_VERSION-bin-hadoop27-scala_2.10.tgz

RUN wget -O "$FLINK_TAR" "http://apache.mirror.anlx.net/flink/flink-$FLINK_VERSION/flink-$FLINK_VERSION-bin-hadoop27-scala_2.10.tgz" && \
	tar -xzvf $FLINK_TAR && \
	ln -sv flink-$FLINK_VERSION flink && \
	rm $FLINK_TAR

ENV FLINK_HOME=/flink
ENV PATH=$PATH:$FLINK_HOME/bin

# Flink UI
EXPOSE 8081

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]