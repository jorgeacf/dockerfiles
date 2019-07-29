FROM php:7.4-rc-apache

MAINTAINER opsforge.io
LABEL name="grav-docker"
LABEL version="1.1.1"

ARG GRAV_VERSION=1.6.11

# install the PHP extensions we need
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
    wget \
    unzip \
    git \
    libjpeg-dev \
    libpng-dev \
    libzip-dev \
    zlib1g-dev \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    apt-get clean && \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install gd zip opcache
# TODO consider removing the *-dev deps and only keeping the necessary lib* packages

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=1024'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
		echo 'upload_max_filesize=128M'; \
		echo 'post_max_size=128M'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN a2enmod rewrite expires

VOLUME /var/www/html

ENV SOURCE="/usr/src/grav"

RUN set -ex; \
  wget https://getgrav.org/download/core/grav/${GRAV_VERSION} && \
  unzip ${GRAV_VERSION} && \
  mkdir -p "$SOURCE" && \
  cp -r grav/. "$SOURCE" && \
  rm -rf grav ${GRAV_VERSION} && \
  chown -R www-data:www-data "$SOURCE"

#RUN cd /usr/src/grav/ && \
#	bin/gpm selfupgrade -f && \
#	bin/gpm update -f -y && \
#	bin/gpm install git-sync -y && \
#  bin/gpm install admin -y

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh && \
  chown root:root /usr/local/bin/entrypoint.sh

EXPOSE 80

ENTRYPOINT ["entrypoint.sh"]
CMD ["apache2-foreground"]