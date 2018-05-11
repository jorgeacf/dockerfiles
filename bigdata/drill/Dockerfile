FROM jorgeacf/centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

ENV PATH $PATH:/drill/bin

LABEL Description="Apache Drill"

ARG APACHE_DRILL_VERSION=1.7.0

ARG TAR=apache-drill-${APACHE_DRILL_VERSION}.tar.gz

ARG URL="http://archive.apache.org/dist/drill/drill-${APACHE_DRILL_VERSION}/${TAR}"

RUN wget -t 100 --retry-connrefused -O "${TAR}" "${URL}" && \
	tar xvf "${TAR}" && \
    rm -fv  "${TAR}" && \
    ln -sv "apache-drill-${APACHE_DRILL_VERSION}" drill

COPY entrypoint.sh /

EXPOSE 8047

ENTRYPOINT ["/entrypoint.sh"]