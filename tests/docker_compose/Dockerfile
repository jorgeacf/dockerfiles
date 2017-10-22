FROM centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="CentOS Development Base Container"

RUN yum update -y && \
	yum install java-1.8.0-openjdk-headless -y  && \
	yum install libev -y && \
	yum install libev-devel -y && \
	#yum install git -y && \
	#yum install make -y && \
	#yum install maven -y && \
	yum install which -y && \
	#yum install curl -y && \
	yum install wget -y && \
	yum install tar -y && \
	#yum install zip -y && \
	yum clean all && \
	yum remove java-1.7.0-openjdk-devel -y && \
	yum remove java-1.7.0-openjdk-headless -y

COPY entrypoint.sh /

CMD ["/entrypoint.sh"]