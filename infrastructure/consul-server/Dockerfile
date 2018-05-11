FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Docker Discovery"

RUN dnf install -y net-tools iputils bind-utils

RUN dnf install -y wget unzip && \
	wget https://releases.hashicorp.com/consul/1.0.7/consul_1.0.7_linux_amd64.zip && \
	unzip consul_1.0.7_linux_amd64.zip && \
	rm consul_1.0.7_linux_amd64.zip && \
	mkdir /opt/consul/ && \
	mv consul /opt/consul/

ENV PATH=$PATH:/opt/consul/

COPY config/* /opt/consul/config/
COPY entrypoint.sh /

#RUN mkdir /opt/consul/data

EXPOSE 53 8500 8600

ENTRYPOINT ["/entrypoint.sh"]

