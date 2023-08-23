FROM fedora:latest
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)

LABEL Description="Jekyll"

RUN dnf install -y make gcc gcc-c++ ruby-devel rubygems redhat-rpm-config

RUN dnf groupinstall -y "Development Tools"

RUN	gem install jekyll bundler && gem cleanup

RUN mkdir /site

WORKDIR /site

COPY entrypoint.sh /

EXPOSE 4000

ENTRYPOINT ["/entrypoint.sh"]
