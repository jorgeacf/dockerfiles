FROM jorgeacf/os-centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Apache HBase"

ARG HBASE_VERSION=1.2.1

ENV PATH $PATH:/hbase/bin

WORKDIR /

RUN wget -t 100 --retry-connrefused -O "hbase-$HBASE_VERSION-bin.tar.gz" "http://www.apache.org/dyn/closer.lua?filename=hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz&action=download"

RUN mkdir hbase-$HBASE_VERSION
RUN tar zxvf hbase-$HBASE_VERSION-bin.tar.gz -C hbase-$HBASE_VERSION --strip 1
RUN ln -sv hbase-$HBASE_VERSION hbase
RUN rm -fv hbase-$HBASE_VERSION-bin.tar.gz
RUN rm -fr /hbase/docs /hbase/src

COPY entrypoint.sh /
COPY config/hbase-site.xml /hbase/conf/

EXPOSE 2181 8080 8085 9090 9095 16000 16010 16201 16301

CMD "/entrypoint.sh"