FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Nginx"

RUN dnf update -y && dnf clean all
RUN dnf install -y nginx && dnf clean all

COPY config/ /etc/nginx/

EXPOSE 80 443

COPY entrypoint.sh /usr/local/bin/

CMD ["entrypoint.sh"]