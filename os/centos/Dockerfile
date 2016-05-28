

FROM centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="CentOS Development Base Container"

RUN \
	yum update -y && \
	yum install -y \
	java-1.8.0-openjdk \
	libev \
    libev-devel \
	git \
	make \
	maven \
	which \
	curl \
	wget \
	tar \
	zip

CMD /bin/bash