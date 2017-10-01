FROM fedora:latest

ARG SBT_VERSION=1.0.1
ARG JAVA_VERSION=jdk1.8.0_144

ENV PATH=$PATH:/opt/jdk/bin:/opt/sbt/bin

RUN dnf install -y wget && \
	
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

	# Sbt
	wget https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz && \
	tar zxvf sbt-$SBT_VERSION.tgz && \
	rm sbt-$SBT_VERSION.tgz && \
	mv /sbt /opt && \
	sbt sbtVersion