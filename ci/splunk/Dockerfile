FROM centos:latest

ARG JAVA_VERSION=jdk1.8.0_144

ENV PATH=$PATH:/opt/jdk/bin

RUN yum install -y wget
	
	# Java
RUN wget \
		--no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
		http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz \
		-O $JAVA_VERSION-linux-x64.tar.gz
RUN	mkdir $JAVA_VERSION && tar -xzf $JAVA_VERSION-linux-x64.tar.gz -C $JAVA_VERSION
RUN	rm $JAVA_VERSION-linux-x64.tar.gz
RUN	mv $JAVA_VERSION /opt
RUN	ln -s /opt/$JAVA_VERSION/ /opt/jdk

RUN wget -O splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.0.0&product=splunk&filename=splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz&wget=true'

RUN tar -xvzf splunk-7.0.0-c8a78efdd40f-Linux-x86_64.tgz

#RUN dnf install procps -y

ENV SPLUNK_GROUP splunk
ENV SPLUNK_USER splunk
ENV SPLUNK_HOME /splunk

# add splunk:splunk user
RUN groupadd -r ${SPLUNK_GROUP} \
    && useradd -r -m -g ${SPLUNK_GROUP} ${SPLUNK_USER}

RUN chown -R ${SPLUNK_USER}:${SPLUNK_GROUP} ${SPLUNK_HOME}

USER $SPLUNK_USER

RUN echo "OPTIMISTIC_ABOUT_FILE_LOCKING = 1" >> $SPLUNK_HOME/etc/splunk-launch.conf

WORKDIR /splunk

EXPOSE 8000