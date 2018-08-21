FROM fedora:latest

RUN dnf install -y java findutils

ARG JENKINS_VERSION
ENV JENKINS_VERSION ${JENKINS_VERSION:-2.121.3}

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

ARG JENKINS_URL=http://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war

RUN curl -fsSL ${JENKINS_URL} -o /usr/share/jenkins/jenkins.war

ENV JENKINS_UC https://updates.jenkins.io
RUN mkdir /var/jenkins_home
RUN chown -R "${user}":"${group}" "${JENKINS_HOME}" /usr/share/jenkins

# TEST
RUN dnf install -y git docker

VOLUME ${JENKINS_HOME}

EXPOSE ${JENKINS_PORT} 

EXPOSE ${JENKINS_SLAVE_AGENT_PORT}

ENV COPY_REFERENCE_FILE_LOG $JENKINS_HOME/copy_reference_file.log

COPY entrypoint.sh /usr/local/bin/

#USER ${user}

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://localhost:${JENKINS_PORT}/login || exit 1

CMD ["entrypoint.sh"]
