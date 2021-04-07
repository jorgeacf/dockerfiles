FROM fedora:30

RUN dnf install -y java-1.8.0-openjdk-devel findutils unzip

ARG VERSION
ARG JENKINS_URL=http://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${VERSION}/jenkins-war-${VERSION}.war

ENV JENKINS_VERSION=${VERSION}

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_PORT 8080
ENV JENKINS_SLAVE_AGENT_PORT 50000

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

RUN useradd --home /home/jenkins jenkins
RUN usermod -G jenkins jenkins

# `/usr/share/jenkins/ref/` contains all reference configuration we want
# to set on a fresh new installation. Use it to bundle additional plugins
# or config file with your custom jenkins Docker image.
RUN mkdir -p /usr/share/jenkins/ref/init.groovy.d
RUN curl -fsSL ${JENKINS_URL} -o /usr/share/jenkins/jenkins.war

RUN mkdir /var/jenkins_home
RUN chown -R "${user}":"${group}" "${JENKINS_HOME}" /usr/share/jenkins


ENV COPY_REFERENCE_FILE_LOG $JENKINS_HOME/copy_reference_file.log

COPY entrypoint.sh /usr/local/bin/

# TEST - to remove
RUN dnf install -y git docker

USER ${user}

VOLUME ${JENKINS_HOME}

EXPOSE ${JENKINS_PORT}

EXPOSE ${JENKINS_SLAVE_AGENT_PORT}

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://localhost:${JENKINS_PORT}/login || exit 1

CMD ["entrypoint.sh"]
