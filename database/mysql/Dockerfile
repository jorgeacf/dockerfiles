FROM fedora:latest

ARG MARIADB_VERSION=10.2.14

ENV MYSQL_HOME=/opt/mysql
ENV PATH=$PATH:$MYSQL_HOME/bin

RUN dnf update -y && \
	dnf install -y wget libstdc++ libaio ncurses-compat-libs hostname && \
	wget https://downloads.mariadb.org/interstitial/mariadb-$MARIADB_VERSION/bintar-linux-x86_64/mariadb-$MARIADB_VERSION-linux-x86_64.tar.gz && \
	tar -xzf mariadb-$MARIADB_VERSION-linux-x86_64.tar.gz  && \
	rm mariadb-$MARIADB_VERSION-linux-x86_64.tar.gz && \
	mv /mariadb-$MARIADB_VERSION-linux-x86_64 /opt/mariadb-$MARIADB_VERSION && \
	ln -s /opt/mariadb-$MARIADB_VERSION/ /opt/mysql && \
	dnf clean all

RUN groupadd mysql && useradd -g mysql mysql

RUN chown -R mysql /opt/mariadb-$MARIADB_VERSION/data

COPY entrypoint.sh /usr/local/bin/

WORKDIR /opt/mysql

RUN ./scripts/mysql_install_db --user=mysql

COPY scripts/* scripts/

USER mysql

EXPOSE 3306

ENTRYPOINT ["entrypoint.sh"]
CMD ["mysql"]