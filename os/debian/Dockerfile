
FROM debian:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Debian Development Base Container"

ENV JAVA_HOME=/usr

RUN apt-get update && \
	apt-get install -y --no-install-recommends openjdk-7-jre-headless && \
    apt-get clean


CMD ["/bin/bash"]
