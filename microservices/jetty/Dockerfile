FROM jorgeacf/os-centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Jetty"

ENV JETTY_VERSION="9.3.12.v20160915"

ENV JETTY_HOME=/jetty

RUN yum install wget -y
RUN wget -O "jetty-$JETTY_VERSION.tar.gz" "http://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/$JETTY_VERSION/jetty-distribution-$JETTY_VERSION.tar.gz"
RUN tar xvzf jetty-$JETTY_VERSION.tar.gz
RUN ln -s jetty-distribution-$JETTY_VERSION jetty

EXPOSE 8080

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]