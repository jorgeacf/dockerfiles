

FROM centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="CentOS Development Base Container"

RUN \
	yum update -y && \
	yum install -y \
	git \
	make \
	maven \
	curl \
	wget

CMD /bin/bash