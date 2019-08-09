FROM debian:stretch

ARG GRAV_VERSION=1.6.11

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# install grav
RUN apt-get update && \
    apt-get -y install --no-install-recommends lsb-release apt-transport-https ca-certificates wget zip unzip git sudo && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.3.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        php7.3-fpm \
        php7.3-cli \
        php7.3-gd \
        php7.3-curl \
        php7.3-mbstring \
        php7.3-xml \
        php7.3-zip \
        php-apcu && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV SOURCE="/usr/src/grav"

RUN set -ex; \
  wget https://getgrav.org/download/core/grav/${GRAV_VERSION} && \
  unzip ${GRAV_VERSION} && \
  mkdir -p "$SOURCE" && \
  cp -r grav/. "$SOURCE" && \
  rm -rf grav ${GRAV_VERSION} && \
  cd ${SOURCE} && \
  bin/gpm selfupgrade -f -y && \
  bin/gpm update -f -y && \
  bin/gpm install admin -y && \
  bin/gpm install git-sync -y && \
  bin/grav sandbox -s /var/www/html

WORKDIR /var/www/html

VOLUME ["/var/www/html"]

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh && \
  chown root:root /usr/local/bin/entrypoint.sh

RUN apt-get update && apt-get -y install curl

EXPOSE 80

ENTRYPOINT ["entrypoint.sh"]
CMD ["grav"]
