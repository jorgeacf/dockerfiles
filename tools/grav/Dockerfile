FROM debian:stretch

ARG VERSION
ARG GRAV_VERSION=${VERSION}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# install grav
RUN apt-get -qq update && \
    apt-get -qq -y install --no-install-recommends lsb-release apt-transport-https ca-certificates wget zip unzip git sudo && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.3.list && \
    apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
        php7.3-fpm \
        php7.3-cli \
        php7.3-gd \
        php7.3-curl \
        php7.3-mbstring \
        php7.3-xml \
        php7.3-zip \
        php-apcu && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/*

ENV SOURCE="/usr/src/grav"

RUN set -ex; \
  wget -q https://getgrav.org/download/core/grav/${GRAV_VERSION} && \
  unzip -q ${GRAV_VERSION} && \
  mkdir -p "$SOURCE" && \
  cp -r grav/. "$SOURCE" && \
  rm -rf grav ${GRAV_VERSION}

WORKDIR ${SOURCE}

RUN \
  bin/gpm selfupgrade -f -y && \
  bin/gpm update -f -y && \
  bin/gpm install admin -y && \
  bin/gpm install git-sync -y
# && \
#  bin/grav sandbox -s /var/www/html

#WORKDIR /var/www/html
WORKDIR ${SOURCE}

#VOLUME ["/var/www/html"]
VOLUME ["${SOURCE}"]

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh && \
  chown root:root /usr/local/bin/entrypoint.sh

RUN apt-get -qq update && \
    apt-get -qq install -y curl && \
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && \
    apt-get -qq install -y build-essential nodejs && \
    npm install -g sass

EXPOSE 80

ENTRYPOINT ["entrypoint.sh"]
CMD ["grav"]
