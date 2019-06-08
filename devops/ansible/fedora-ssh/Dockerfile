FROM fedora:latest


RUN dnf update -y && \
	dnf install -y openssh-server passwd && \
	dnf clean all

COPY entrypoint.sh /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]