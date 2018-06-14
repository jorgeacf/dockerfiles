FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="DNSMASQ"

RUN dnf install -y dnsmasq procps inotify-tools

RUN mkdir /hosts

COPY config/* /etc/
COPY entrypoint.sh /usr/local/bin/

EXPOSE 53

ENTRYPOINT ["entrypoint.sh"]
CMD ["dnsmasq"]