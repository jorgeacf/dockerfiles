FROM jorgeacf/os-centos:latest

RUN yum install -y openssh-clients

RUN mkdir /root/.ssh

COPY id_rsa /root/.ssh/id_rsa
COPY id_rsa.pub /root/.ssh/id_rsa.pub
COPY authorized_keys /root/.ssh/authorized_keys
COPY config /root/.ssh/config
RUN chmod 600 /root/.ssh/config

CMD ["bash"]