FROM fedora:latest

RUN dnf install -y git

ARG USERNAME=user
ARG GROUPNAME=group
ARG UID=1000
ARG GID=1000

RUN groupadd $GROUPNAME -g $GID

RUN useradd -g $GROUPNAME -u $UID -m $USERNAME

USER $USERNAME

WORKDIR /home/$USERNAME

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]