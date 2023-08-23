FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Docker Discovery"

ARG CONSUL_VERSION=1.1.0

ENV PATH=$PATH:/opt/consul/

RUN dnf install -y wget unzip net-tools iputils bind-utils hostname && \
	wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
	unzip consul_${CONSUL_VERSION}_linux_amd64.zip && \
	rm consul_${CONSUL_VERSION}_linux_amd64.zip && \
	mkdir /opt/consul/ && \
	mv consul /opt/consul/

COPY config/* /opt/consul/config/
COPY entrypoint.sh /usr/local/bin/

#RUN mkdir /opt/consul/data

EXPOSE 53 8500 8600

ENTRYPOINT ["entrypoint.sh"]
CMD ["consul-server"]