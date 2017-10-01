FROM fedora:latest

ARG MAVEN_VERSION=3.5.0
ARG JAVA_VERSION=jdk1.8.0_144

ENV PATH=$PATH:/opt/jdk/bin:/opt/maven/bin
ENV JAVA_HOME=/opt/jdk

RUN dnf install -y wget which && \
	
	# Java
	wget --no-cookies \
		--no-check-certificate \
		--header "Cookie: oraclelicense=accept-securebackup-cookie" \
		"http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz" \
		-O $JAVA_VERSION-linux-x64.tar.gz && \
	tar -xzf $JAVA_VERSION-linux-x64.tar.gz && \
	rm $JAVA_VERSION-linux-x64.tar.gz && \
	mv $JAVA_VERSION /opt && \
	ln -s /opt/$JAVA_VERSION/ /opt/jdk && \

	# Maven
	wget http://apache.mirrors.nublue.co.uk/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
	mv /apache-maven-$MAVEN_VERSION /opt && \
	ln -s /opt/apache-maven-$MAVEN_VERSION /opt/maven
