FROM fedora:latest

RUN yum -y install gcc gcc-c++ libffi-devel python-devel python-pip python-wheel openssl-devel cyrus-sasl-devel openldap-devel

RUN pip install --upgrade setuptools pip

RUN pip install virtualenv

RUN python -m venv venv && \
	. venv/bin/activate

RUN pip install apache-superset
RUN superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin

ENV FLASK_APP=superset
ENV LDFLAGS="-L$(brew --prefix openssl)/lib"
ENV CFLAGS="-I$(brew --prefix openssl)/include"

#RUN superset db upgrade
#RUN superset load_examples
#RUN superset init

COPY entrypoint.sh /

EXPOSE 8088

ENTRYPOINT ["/entrypoint.sh"]