
FROM jorgeacf/os-centos
MAINTAINER Jorge Figueiredo (http://blog.jorgefigueiredo.com)


LABEL Description="MySQL"

RUN \
	yum install libaio -y && \
	wget -O "mysql-5.7.13-linux-glibc2.5-x86_64.tar" "http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.13-linux-glibc2.5-x86_64.tar" && \
	tar -xvf "mysql-5.7.13-linux-glibc2.5-x86_64.tar" && \
	tar zxvf "mysql-5.7.13-linux-glibc2.5-x86_64.tar.gz" && \
	rm -f *.tar* && \
	ln -sv "mysql-5.7.13-linux-glibc2.5-x86_64" mysql

RUN	groupadd mysql
RUN	useradd -r -g mysql -s /bin/false mysql
RUN cd mysql
#RUN	mkdir mysql-files
#RUN	chmod 750 mysql-files
#RUN	chown -R mysql:mysql .
#RUN	chgrp -R mysql:mysql .
#RUN /mysql/bin/mysqld --initialize --user=mysql
#RUN /mysql/bin/mysql_ssl_rsa_setup
#RUN chown -R root .
#RUN chown -R mysql data mysql-files

COPY entrypoint.sh /

CMD /entrypoint.sh