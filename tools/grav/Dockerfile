FROM debian:stretch

ARG GRAV_VERSION=1.6.11

# install grav / nginx prerequisites
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install lsb-release apt-transport-https ca-certificates wget zip unzip nginx git openssl sudo && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.3.list && \
    apt-get update && \
    apt-get install -y \
        php7.3-fpm \
        php7.3-cli \
        php7.3-gd \
        php7.3-curl \
        php7.3-mbstring \
        php7.3-xml \
        php7.3-zip \
        php-apcu

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
  chown -R www-data:www-data "$SOURCE"

WORKDIR /var/www/html

VOLUME ["/var/www/html"]

COPY entrypoint.sh /usr/local/bin/
COPY config/sites-enabled/* /etc/nginx/sites-enabled

RUN chmod +x /usr/local/bin/entrypoint.sh && \
  chown root:root /usr/local/bin/entrypoint.sh

RUN rm -f /etc/nginx/sites-available/default && \
    rm -f /etc/nginx/sites-enabled/default

EXPOSE 80 443

ENTRYPOINT ["entrypoint.sh"]
CMD ["grav"]