FROM ubuntu:16.04
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Docker - OpenLdap"

RUN apt-get update && export RUNLEVEL=1 && echo exit 0 > /usr/sbin/policy-rc.d && DEBIAN_FRONTEND=noninteractive apt-get install -y slapd ldap-utils

COPY entrypoint.sh /usr/local/bin/
COPY conf/* /

EXPOSE 389 636

ENTRYPOINT ["entrypoint.sh"]
