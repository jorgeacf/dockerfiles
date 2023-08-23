FROM ubuntu:trusty
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

RUN apt-get update -y && \
	apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:webupd8team/java && \
	apt-get update -y

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
	apt-get install -y oracle-java8-installer && \
	apt-get install --fix-missing -q -y \
	  git \
	  ant \
	  gcc \
	  g++ \
	  libkrb5-dev \
	  libmysqlclient-dev \
	  libssl-dev \
	  libsasl2-dev \
	  libsasl2-modules-gssapi-mit \
	  libsqlite3-dev \
	  libtidy-0.99-0 \
	  libxml2-dev \
	  libxslt-dev \
	  libffi-dev \
	  make \
	  maven \
	  libldap2-dev \
	  python-dev \
	  python-setuptools \
	  libgmp3-dev \
	  libz-dev

RUN git clone https://github.com/cloudera/hue.git

WORKDIR /hue

RUN make apps

WORKDIR /

COPY config/pseudo-distributed.ini /hue/desktop/conf/pseudo-distributed.ini

EXPOSE 8888

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]