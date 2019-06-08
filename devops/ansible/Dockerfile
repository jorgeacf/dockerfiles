FROM fedora:latest


RUN dnf update -y && \
	dnf install -y ansible openssh-clients && \
	dnf clean all

RUN echo "===> Adding hosts for convenience..."     && \
    mkdir -p /etc/ansible                       	&& \
	echo '172.17.0.2' >> /etc/ansible/hosts			&& \
	echo '172.17.0.3' >> /etc/ansible/hosts			&& \
	echo '172.17.0.4' >> /etc/ansible/hosts

RUN mkdir ~/.ssh
COPY .ssh-keys/key /root/.ssh/id_rsa

RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 755 /root/.ssh

# Fix for fingerprint
ENV ANSIBLE_HOST_KEY_CHECKING False

CMD [ "ansible", "--version" ]