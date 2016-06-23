

FROM centos:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="CentOS Development Base Container"

RUN yum update -y
RUN yum install java-1.8.0-openjdk -y
RUN yum install libev -y
RUN yum install libev-devel -y
RUN yum install git -y
RUN yum install make -y
RUN yum install maven -y
RUN yum install which -y
RUN yum install curl -y
RUN yum install wget -y
RUN yum install tar -y
RUN yum install zip -y
RUN yum clean all

CMD /bin/bash