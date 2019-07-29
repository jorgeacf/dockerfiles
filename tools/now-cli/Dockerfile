FROM fedora:latest

RUN dnf -y install nodejs

RUN	npm i -g --unsafe-perm now

RUN npm update -g now

ENTRYPOINT [ "now" ]