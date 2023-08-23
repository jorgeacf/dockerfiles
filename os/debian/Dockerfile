FROM debian:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Debian Development Base Container"

ENV JAVA_HOME=/usr

RUN apt-get update && \
#	apt-get install -t jessie-backports  openjdk-8-jre-headless ca-certificates-java && \
    apt-get clean


CMD ["/bin/bash"]
